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
  final OldCodeExpr init;

  CodeArg._({this.name, this.type, this.init});

  /// Try parse a dynamic value to an argument object.
  static CodeArg _parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode(value, (v) {
      if (v is List && v.isNotEmpty && v.length < 4) {
        var hasError = false;
        // Parse the argument as an array of name, type, init.
        var res = CodeArg.of(
          name: CodeArgName.of(v[0]),
          type: v.length < 2
              ? null
              : CodeType._parse(v[1], error: () {
                  hasError = true;
                }),
          init: v.length < 3 ? null : OldCodeExpr.of(v[2]),
        );

        if (hasError) return null;
        return res;
      } else if (v is MapEntry) {
        return CodeArg.of(name: v.key, type: v.value);
      } else {
        return CodeArg.of(name: CodeArgName.of(value), type: null);
      }
    }, error: error);
  }

  factory CodeArg.of({
    @required dynamic name,
    @required dynamic type,
    dynamic init,
  }) =>
      CodeArg._(
          name: CodeArgName.of(name),
          type: CodeType._parse(type, error: () {
            throw '$type is not a valid data type';
          }),
          init: init != null ? OldCodeExpr.of(init) : null);
}
