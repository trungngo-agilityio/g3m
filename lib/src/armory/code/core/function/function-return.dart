part of g3.armory;

class CodeFunctionReturnConfig extends CodeConfigNode<CodeFunctionReturn> {
  CodeFunctionReturnConfig(
      NodeBuildFunc<CodeFunctionReturn> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionReturnConfig.forDartLike(Node child) =>
      CodeFunctionReturnConfig((context, funcReturn) {
        final async = funcReturn.async == true;
        final stream = funcReturn.stream == true;
        if (async && stream) {
          return Container([funcReturn.type, ' async*']);
        } else if (async) {
          return Container([funcReturn.type, ' async']);
        } else if (stream) {
          return Container([funcReturn.type, ' sync*']);
        } else {
          return funcReturn.type;
        }
      }, child);

  factory CodeFunctionReturnConfig.forJavaLike(Node child) =>
      CodeFunctionReturnConfig((context, funcReturn) {
        return funcReturn.type;
      }, child);
}

class CodeFunctionReturn extends CodeConfigProxyNode<CodeFunctionReturn> {
  final CodeType type;
  final bool async;
  final bool stream;

  CodeFunctionReturn({this.type, this.async, this.stream});

  factory CodeFunctionReturn.simple(
    String type, {
    bool async,
    bool stream,
  }) =>
      CodeFunctionReturn(
        type: CodeType.simple(type),
        async: async,
        stream: stream,
      );
}
