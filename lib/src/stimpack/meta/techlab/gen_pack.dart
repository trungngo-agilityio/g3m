part of g3.stimpack.meta.techlab;

class StimGenMetaPack implements Node {
  final StimModelPackage pack;

  /// The external packs referred by this pack.
  /// This can be determined by figure out the types user by the other
  /// package.
  final Iterable<StimModelPackage> externalPacks;
  final Iterable<StimModelType> externalTypesWithValues;

  StimpackCodeConfig _config;

  StimName _packClassName;

  CodeField _packInstanceField;
  CodeField _metaPackageField;
  CodeFunction _initFunctionOfPackClass;

  StimGenMetaPack(
    this.pack,
    this.externalPacks,
    this.externalTypesWithValues,
  );

  @override
  Node build(BuildContext context) {
    // This file is rather complex. Before building anything,
    // set up commonly access variables first.
    _preBuild(context);

    final fileName = _config.packFileNameOf(pack);

    // Generates a dart file that defines the entry point
    // for the whole pack.
    return DartCodeFile.of(
      fileName,
      package: _config.codeGeneratedPackageLibraryOf(pack, isPart: true),
      fields: [
        _buildPackInstanceField(),
      ],
      classes: [
        // The internal implementation.
        _buildPackClassDef(),
      ],
    );
  }

  void _preBuild(BuildContext context) {
    _config = context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();
    _packClassName = _config.packClassNameOf(pack);

    final modelMeta = stimpack.model.type.model;
    _metaPackageField = CodeField.of(
      name: 'meta package',
      isPrivate: true,
      type: modelMeta.package.name,
    );
  }

  /// Generates an implementation for the abstract pack class (generated by
  /// [_abstractTypeClass] function.)
  ///
  CodeClass _buildPackClassDef() {
    // ------------------------------------------------------------------------
    // fields & properties
    // ------------------------------------------------------------------------

    // This is the list of fields to be generated in the class.
    final fields = <CodeField>[_metaPackageField];

    // This is the list of properties to be generated in the class.
    final properties = <CodeProperty>[];

    // This is the array of scopes init expressions, to be putted inside
    // the class constructor.
    final inits = <Node>[];

    // Loops through all types in the pack, for each type, generate
    // a field for the scope implementation, a property for readonly
    // scope access. An example of property is [_StimMetaMetaImpl._type]
    // and [_StimMetaMetaImpl.type].
    //
    for (final type in pack.types) {
      final symbolClassName = _config.symbolClassNameOf(type);
      final scopeImplClass = _config.scopeClassNameOf(type);
      final fieldName = _config.fieldNameOfType(type);

      final field = CodeField.of(
        name: fieldName,
        type: scopeImplClass,
        isFinal: true,
        comment: '''Scope class for constructing all "${fieldName}" symbols, 
typed of [$symbolClassName]."''',
      );

      fields.add(field);

      // Adds an expression to invoke constructor to create scope fields.
      inits.add(
        CodeAssignExpr.of(
          CodeRef.of(field),
          CodeConstructorCall.of(className: scopeImplClass),
        ),
      );
    }

    for (final externalType in externalTypesWithValues) {
      final className = _config.valueExtClassName(pack, externalType);
      final fieldName = _config.valueExtFieldName(pack, externalType);

      fields.add(CodeField.of(
        name: fieldName,
        type: className,
        isFinal: true,
      ));

      // Initializes the meta field with a final instance.
      inits.add(CodeAssignExpr.of(
        CodeRef.of(fieldName),
        CodeConstructorCall.of(className: className),
      ));
    }

    // ------------------------------------------------------------------------
    // _buildMeta() function
    // ------------------------------------------------------------------------

    final buildMetaFunction = CodeFunction.of(
      name: 'build meta',
      isPrivate: true,
      returns: 'void',
      body: _buildMetaFunctionBody(_config),
    );

    // The constructor just need to create all scopes.
    final initPackFunctionName = _config.initPackFunctionNameOf(pack);

    // ------------------------------------------------------------------------
    // constructors
    // ------------------------------------------------------------------------

    final constructorArgs = <CodeArg>[];
    for (final p in externalPacks) {
      if (p.isDart) continue;
      constructorArgs.add(
        CodeArg.of(
          name: p.name,
          type: _config.packClassNameOf(p),
        ),
      );
    }

    final constructor = CodeConstructor.of(
      requiredArgs: constructorArgs,
      init: [
        ...inits,
        CodeFunctionCall.ofSuper(
          args: CodeStringLiteral.of(pack.name),
        ),
      ],
    );

    _initFunctionOfPackClass = CodeFunction.of(
      name: 'init',
      returns: CodeType.ofVoid(),
      isPrivate: true,
      body: [
        '\n',
        CodeFunctionCall.of(
          name: '_buildMeta',
          comment:
              '''Builds the meta definition that defines the structure of this pack.''',
        ),
      ],
    );

    // ------------------------------------------------------------------------
    // Generates final class.
    // ------------------------------------------------------------------------

    return CodeClass.of(
      name: _packClassName,
      extend: 'stim pack',
      fields: fields,
      properties: properties,
      constructors: constructor,
      functions: [
        _buildPackExtensionOnStimpack(),
        _initFunctionOfPackClass,
        buildMetaFunction,
      ],
    );
  }

  Node _buildMetaFunctionBody(StimpackCodeConfig config) {
    final typeExtFieldName =
        _config.valueExtFieldName(pack, stimpack.model.type.model.type);
    final nodes = <Node>[
      Container([
        '''
final m = stimpack.model, f = m.field, t = m.type;
final mp = _metaPackage = m.package.of(name: '${pack.name.camel()}');
final mt = ${typeExtFieldName};''',
      ]),
    ];

    final typeDefs = <Node>[];
    final buildFields = <Node>[];

    for (final type in pack.types) {
      final fieldName = _config.fieldNameOfType(type);
      final args = <Node>[
        CodeNameArgExpr.of('name', CodeStringLiteral.of(fieldName)),
        CodeNameArgExpr.of('package', CodeRef.of('mp')),
      ];

      final typeOfCall = CodeFunctionCall.of(
        instance: 't',
        name: 'symbolOf',
        args: args,
      );
      // stop if this field does not have and fields.

      typeDefs.add(Container([
        '\n',
        CodeComment.of('Builds type "${fieldName}"'),
        CodeAssignExpr.of('mt.${fieldName}', typeOfCall),
      ]));

      if (type.fields?.isNotEmpty != true) continue;

      final fieldDefs = <Node>[];

      for (final field in type.fields) {
        final fieldTypeName = _buildTypeName(field.type);

        Node def = CodeFunctionCall.of(
          instance: 'f',
          name: 'of',
          args: [
            CodeNameArgExpr.of('name', CodeStringLiteral.of(field.name)),
            CodeNameArgExpr.of('type', fieldTypeName)
          ],
        );

        if (field.isRequired) {
          def = CodeFunctionCall.of(instance: def, name: 'required');
        }

        fieldDefs.add(
          Container([
            '\n',
            CodeComment.of('field "${fieldName}"'),
            def,
          ]),
        );
      }

      buildFields.add(
        Container([
          '\n',
          CodeComment.of('Builds fields for type "${fieldName}"'),
          CodeAssignExpr.of(
            'mt.${fieldName}.fields',
            CodeSetLiteral.of(fieldDefs),
          ),
        ]),
      );
    }

    return Container([
      ...nodes,
      ...typeDefs,
      ...buildFields,
    ]);
  }

  Node _buildTypeName(StimModelType type, [Set<StimModelType> processing]) {
    assert(processing?.contains(type) != true,
        'Error. recursive type definition found.');
    processing = Set.of(processing ?? {})..add(type);

    if (type.isCollection) {
      if (type.isDartSet) {
        return Container([
          't.setOf(item: ',
          _buildTypeName(type.item, processing),
          ')',
        ]);
      } else if (type.isDartList) {
        return Container([
          't.listOf(item: ',
          _buildTypeName(type.item, processing),
          ')',
        ]);
      } else {
        throw 'Do not support custom collection type ${type.collection}';
      }
    } else if (type.isDart) {
      // This type come from outside.
      final name = _config.fieldNameOfType(type);
      return Text.of('t.${name}');
    } else if (type.package.name != pack.name) {
      // This type come from outside.
      final name = _config.fieldNameOfType(type);
      return Text.of('t.${type.package.name}.${name}');
    } else {
      // This type is defined in the package.
      final name = _config.fieldNameOfType(type);
      return Text.of('mt.${name}');
    }
  }

  CodeField _buildPackInstanceField() {
    return _packInstanceField = CodeField.of(
      name: pack.name,
      type: _packClassName,
      isPrivate: true,
      comment: 'The only instance of the [$_packClassName] pack.',
    );
  }

  CodeFunction _buildPackExtensionOnStimpack() {
    final constructorArgs = <Node>[];
    for (final p in externalPacks) {
      if (p.isDart) continue;
      constructorArgs.add(CodeRef.of('stimpack.${p.name.camel()}'));
    }

    var packInstanceRef = CodeRef.of(_packInstanceField);
    final createPackInstance = CodeAssignExpr.of(
      packInstanceRef,
      CodeConstructorCall.of(
        className: _packClassName,
        args: constructorArgs,
      ),
    );

    final returnPackInstance = CodeReturn.of(
      packInstanceRef,
    );

    final triggerInit =
        CodeFunctionCall.of(instance: packInstanceRef, name: '_init');

    var createInstanceIfNull = CodeIf.of(
        condition: CodeEqualExpr.of(packInstanceRef, CodeNullLiteral()),
        then: [
          createPackInstance,
          triggerInit,
        ]);

    return CodeFunction.of(
        name: _config.packInstanceFactoryNameOf(pack),
        isStatic: true,
        returns: _packInstanceField.type,
        body: [createInstanceIfNull, returnPackInstance],
        comment: '''
Provides global access to the "${pack.name}" pack. Only one instance of the pack 
is created. During the creation, other packs that this pack depends on might 
be created as well.''');
  }
}
