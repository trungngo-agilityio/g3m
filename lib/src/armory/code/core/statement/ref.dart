part of g3.armory;

class CodeRefConfig extends CodeConfigNode<CodeRef> {
  CodeRefConfig(NodeBuildFunc<CodeRef> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeRefConfig.forJavaLike(Node child) =>
      CodeRefConfig((context, expr) {
        return expr.child;
      }, child);
}

class CodeRef extends CodeConfigProxyNode<CodeRef> {
  final Node child;

  CodeRef._(this.child);

  factory CodeRef.ofField(CodeField field) => CodeRef.ofFieldName(field.name);

  factory CodeRef.ofFieldName(CodeFieldName field) => CodeRef._(field);

  factory CodeRef.ofVar(CodeVar varz) => CodeRef.ofVarName(varz.name);

  factory CodeRef.ofVarName(CodeVarName varName) => CodeRef._(varName);

  factory CodeRef.ofProperty(CodeProperty property) =>
      CodeRef.ofPropertyName(property.name);

  factory CodeRef.ofPropertyName(CodePropertyName propertyName) =>
      CodeRef._(propertyName);

  factory CodeRef.ofClass(CodeClass clazz) => CodeRef.ofClassName(clazz.name);

  factory CodeRef.ofClassName(CodeClassName clazzName) => CodeRef._(clazzName);

  factory CodeRef.ofThis() => CodeRef._(Text.of('this'));

  factory CodeRef.ofSuper() => CodeRef._(Text.of('super'));
}
