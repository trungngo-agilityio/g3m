part of g3.techlab;

class CodeArgListConfig extends CodeConfigNode<CodeArgList> {
  CodeArgListConfig(NodeBuildFunc<CodeArgList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeArgListConfig.forDartLike(Node child) =>
      CodeArgListConfig._internal(child, isDart: true);

  factory CodeArgListConfig.forJavaLike(Node child) =>
      CodeArgListConfig._internal(child);

  factory CodeArgListConfig._internal(
    Node child, {
    bool isDart = false,
  }) =>
      CodeArgListConfig((context, expr) {
        Node required = expr.required?.isNotEmpty == true
            ? Join.commaSeparated(expr.required)
            : null;

        Node optional = expr.optional?.isNotEmpty == true
            ? Join.commaSeparated(expr.optional)
            : null;

        Node named = expr.named?.isNotEmpty == true
            ? Join.commaSeparated(expr.named)
            : null;

        final args = <Node>[];

        if (required != null) {
          args.add(required);
        }

        if (optional != null) {
          if (isDart == true) optional = Pad.squareBrackets(optional);
          args.add(optional);
        }

        if (named != null) {
          if (isDart == true) named = Pad.curlyBrackets(named);
          args.add(named);
        }

        return Join.commaSeparated(args);
      }, child);
}

class CodeArgList extends CodeConfigProxyNode<CodeArgList> {
  /// The list of required arguments.
  final List<CodeArg> required;

  /// The list of positioned arguments.
  final List<CodeArg> optional;

  /// The list of named arguments.
  final List<CodeArg> named;

  CodeArgList._({this.required, this.optional, this.named});

  factory CodeArgList.of({
    dynamic required,
    dynamic optional,
    dynamic named,
  }) {
    return CodeArgList._(
      required: _parseNodeList<CodeArg>(required, CodeArg._parse),
      optional: _parseNodeList<CodeArg>(optional, CodeArg._parse),
      named: _parseNodeList<CodeArg>(named, CodeArg._parse),
    );
  }
}
