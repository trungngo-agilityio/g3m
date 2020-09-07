part of g3.stimpack.meta.techlab;

class StimGenMetaInit implements Node {
  final StimModelPackage pack;

  StimpackCodeConfig _config;

  CodeFunction _initFunction;

  StimGenMetaInit(this.pack);

  @override
  Node build(BuildContext context) {
    _config = context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();
    final fileName = _config.libFileNameOf(pack).toString();
    final libExtFileName = _config.libExtFileNameOf(pack);
    final generatedLibFileName = _config.generatedLibFileNameOf(pack);

    _initFunction = _buildInitFunction();
    return DartCodeFile.of(
      fileName,
      overwriteIfExists: false,
      package: _config.codeInitPackageLibraryOf(pack),
      imports: [
        CodeImport.of(path: 'package:g3m/stimpack_core.dart'),
        CodeImport.of(path: 'generated/def/${generatedLibFileName}.dart'),
      ],
      parts: [
        'generated/${libExtFileName}.dart',
      ],
      functions: [
        _initFunction,
      ],
    );
  }

  /// Builds the function that will inits the pack.
  /// This function shall need to be called before the pack is ready
  /// for external usage.
  CodeFunction _buildInitFunction() {
    final name = pack.name.camel();
    return CodeFunction.of(
      name: _config.initPackFunctionNameOf(pack),
      isPrivate: true,
      returns: CodeType.ofVoid(),
      comment: 'This function is called during the initialization of ${name}',
      body: CodeComment.of('init ${name} here'),
    );
  }
}
