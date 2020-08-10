part of g3.armory;

class CodeNameConfig extends CodeConfigNode<CodeName> {
  CodeNameConfig(NodeBuildFunc<CodeName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeNameConfig.forJavaLike(Node child) => CodeNameConfig.forCode(
        child,
        dataType: pascal,
        clazz: pascal,
        field: camel,
        function: camel,
        functionArg: camel,
        genericParam: pascal,
        other: camel,
      );

  factory CodeNameConfig.forCode(
    Node child, {
    @required StringFunc dataType,
    @required StringFunc clazz,
    @required StringFunc field,
    @required StringFunc function,
    @required StringFunc functionArg,
    @required StringFunc genericParam,
    @required StringFunc other,
  }) =>
      CodeNameConfig((context, name) {
        // Finds the nearest container for this comment.
        final container = context.ancestors.firstWhere(
            (e) =>
                e is CodeDataType ||
                e is CodeClass ||
                e is CodeField ||
                e is CodeFunction ||
                e is CodeFunctionArg ||
                e is CodeGenericParam,
            orElse: () => null);

        var func;
        if (container != null) {
          // Determines the comment style for the given container.
          if (container is CodeDataType) {
            func = dataType;
          } else if (container is CodeClass) {
            func = clazz;
          } else if (container is CodeField) {
            func = field;
          } else if (container is CodeFunction) {
            func = function;
          } else if (container is CodeFunctionArg) {
            func = functionArg;
          } else if (container is CodeGenericParam) {
            func = genericParam;
          }
        }

        func ??= other;

        return TextTransform(name.content, func);
      }, child);
}

class CodeName extends CodeConfigProxyNode<CodeName> {
  final Node content;

  CodeName(this.content);

  factory CodeName.of(String text) {
    return CodeName(Text(text));
  }
}
