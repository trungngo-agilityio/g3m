part of g3.armory;

class CodeArgConfig extends CodeConfigNode<CodeArg> {
  CodeArgConfig(NodeBuildFunc<CodeArg> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeArgConfig.forDartLike(Node child) {
    return CodeArgConfig._internal(child, acceptThisSyntax: true);
  }

  factory CodeArgConfig.forJavaLike(Node child) {
    return CodeArgConfig._internal(child);
  }

  factory CodeArgConfig._internal(
    Node child, {
    bool typeFirst = true,
    String separator = ' ',
    bool acceptThisSyntax = false,
  }) {
    return CodeArgConfig((context, arg) {
      final container = context.ancestors.firstWhere(
          (e) => e is CodeClassConstructor || e is CodeFunction,
          orElse: () => null);

      Node type = arg.type;
      Node name = arg.name;

      Node typeAndName;

      if (type != null && name != null) {
        typeAndName = typeFirst
            ? Container([type, separator, name])
            : Container([name, separator, type]);
      } else if (name != null) {
        if (container is CodeClassConstructor && acceptThisSyntax == true) {
          // Appends ".this" prefix to the constructor argument.
          typeAndName = Pad.left('this.', name);
        } else {
          typeAndName = name;
        }
      } else {
        typeAndName = type;
      }

      Node init = arg.init;
      if (init != null) {
        init = Container([' = ', arg.init]);
      }

      return Container([typeAndName, init]);
    }, child);
  }
}

class CodeArg extends CodeConfigProxyNode<CodeArg> {
  /// The argument name.
  final CodeArgName name;

  /// The argument data type. This is required in most case, however, for
  /// constructor argument, if this is missing, the argument can be
  /// like `this.name`, just like how dart language work.
  final CodeType type;

  /// The argument initializer
  final CodeExpr init;

  CodeArg._({this.name, this.type, this.init});

  factory CodeArg.of({
    @required String name,
    @required String type,
    dynamic init,
  }) =>
      CodeArg._(
          name: CodeArgName.of(name),
          type: CodeType.simple(type),
          init: init != null ? CodeExpr.of(init) : null);
}
