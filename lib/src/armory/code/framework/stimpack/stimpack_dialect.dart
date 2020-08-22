part of g3.armory.stimpack;

class StimpackDialect implements Node {
  final String name;
  final Set<Model> models;

  StimpackDialect({
    this.name,
    @required Model models,
  })  : assert(name != null),
        assert(models != null),
        models = models.eval();

  CodePackage codePackage() {
    return CodePackage.of(name, path: ['g3m', 'stimpack']);
  }

  CodePackage codePackagePart() {
    return CodePackage.partOf(name, path: ['g3m', 'stimpack']);
  }

  CodeClassName codeExprClassName(String exprName) {
    return CodeClassName.of(exprName);
  }

  CodeClassName codeScopeClassName(String exprName) {
    return CodeClassName.of('$exprName scope');
  }

  CodeClassName codeWorldClassName() {
    return CodeClassName.of('$name world');
  }

  @override
  Node build(BuildContext context) {
    return StimpackCodeConfig(
      Container([
        StimpackWorldFile(),
        StimpackLibFile(),
        ...models.map((e) => StimpackExprFile(e)).toList(),
      ]),
    );
  }
}
