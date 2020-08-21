part of g3.armory;

class CodeCustomConfig extends CodeConfigNode<CodeCustom> {
  final String startMarker;

  final String endMarker;

  CodeCustomConfig(this.startMarker, this.endMarker,
      NodeBuildFunc<CodeCustom> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeCustomConfig.forJavaLike(
    Node child, {
    String startMarker = 'region custom code',
    String endMarker = 'endregion custom code',
    StringFunc comment,
  }) =>
      CodeCustomConfig(startMarker, endMarker, (context, expr) {
        comment ??= StringFuncs.code.commentDoubleSplash;
        return Container([
          '\n',
          comment(startMarker),
          '\n',
          expr.child,
          '\n',
          comment(endMarker),
        ]);
      }, child);
}

// region abc
// endregion abc

class CodeCustom extends CodeConfigProxyNode<CodeCustom> {
  final Node child;

  CodeCustom([this.child]);
}
