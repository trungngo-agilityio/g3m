part of g3.stimpack.meta.techlab;

class StimGenMetaInit implements Node {
  final StimModelPackage pack;

  StimGenMetaInit(this.pack);

  @override
  Node build(BuildContext context) {
    final config =
        context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();
    final fileName = config.initPackFileNameOf(pack).toString();

    final name = pack.name.camel();
    return DartCodeFile.of(
      fileName,
      overwriteIfExists: false,
      package: config.codePackageLibraryOf(pack, isPart: true),
      functions: [
        CodeFunction.of(
          name: config.initPackFunctionNameOf(pack),
          requiredArgs: CodeArg.of(
            name: 'pack',
            type: config.packClassNameOf(pack),
          ),
          returns: CodeType.ofVoid(),
          comment:
              'This function is called during the initialization of ${name}',
          body: CodeComment.of('init ${name} here'),
        ),
      ],
    );
  }
}
