part of g3.stimpack.meta.techlab;

class StimGenMetaInitExt implements Node {
  final StimModelPackage pack;

  StimpackCodeConfig _config;

  StimName _packClassName;
  CodeField _packInstanceField;

  StimGenMetaInitExt(this.pack);

  @override
  Node build(BuildContext context) {
    _config = context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();
    final fileName = _config.libExtFileNameOf(pack).toString();

    _packClassName = _config.packClassNameOf(pack);
    _packInstanceField = _buildPackInstanceField();

    return DartCodeFile.of(
      fileName,
      package: _config.codeInitPackageLibraryOf(pack, isPart: true),
      fields: [
        _packInstanceField,
      ],
      extensions: [
        _buildPackExtensionOnStimpack(),
      ],
    );
  }

  CodeExtension _buildPackExtensionOnStimpack() {
    /// The pack class className.
    final className = _config.packExtensionClassNameOf(pack);

    var instanceFieldRef = CodeRef.of(_packInstanceField);
    final returnPackInstance = CodeReturn.of(instanceFieldRef);

    final getInstanceCall = CodeFunctionCall.of(
      instance: _config.packClassNameOf(pack),
      name: _config.packInstanceFactoryNameOf(pack),
    );

    final initFuncName = _config.initPackFunctionNameOf(pack);
    final createInstanceIfNull = CodeIf.of(
        condition: CodeEqualExpr.of(instanceFieldRef, CodeNullLiteral()),
        then: [
          CodeAssignExpr.of(instanceFieldRef, getInstanceCall),

          // FIXME: The function private is not respected.
          // CodeFunctionCall.of(name: _initFunction),
          CodeFunctionCall.of(name: '_$initFuncName'),
        ]);

    final lazyInitProp = CodeProperty.of(
      name: _packInstanceField.name,
      type: _packInstanceField.type,
      getter: CodePropertyGetter.of(
        body: [
          createInstanceIfNull,
          returnPackInstance,
        ],
      ),
    );

    return CodeExtension.of(
      name: className,
      on: 'stimpack root',
      properties: [lazyInitProp],
      comment: '''
Provides global access to the "${pack.name}" pack. Only one instance of the pack 
is created. During the creation, other packs that this pack depends on might 
be created as well.
 ''',
    );
  }

  CodeField _buildPackInstanceField() {
    return _packInstanceField = CodeField.of(
      name: pack.name,
      type: _packClassName,
      isPrivate: true,
      comment: 'The only instance of the [$_packClassName] pack.',
    );
  }
}
