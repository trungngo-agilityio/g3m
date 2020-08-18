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

  // FIXME
  factory CodeRef.ofField(CodeField field) => CodeRef.ofFieldName(field.name);

  // FIXME
  factory CodeRef.ofFieldName(CodeFieldName field) => CodeRef._(field);

  // FIXME
  factory CodeRef.ofVar(CodeVar varz) => CodeRef.ofVarName(varz.name);

  // FIXME
  factory CodeRef.ofVarName(CodeVarName varName) => CodeRef._(varName);

  // FIXME
  factory CodeRef.ofProperty(CodeProperty property) =>
      CodeRef.ofPropertyName(property.name);

  // FIXME
  factory CodeRef.ofPropertyName(CodePropertyName propertyName) =>
      CodeRef._(propertyName);

  // FIXME
  factory CodeRef.ofClass(CodeClass clazz) => CodeRef.ofClassName(clazz.name);

  // FIXME
  factory CodeRef.ofClassName(CodeClassName clazzName) => CodeRef._(clazzName);

  // FIXME
  factory CodeRef.ofThis() => CodeRef._(Text.of('this'));

  // FIXME
  factory CodeRef.ofSuper() => CodeRef._(Text.of('super'));
}
