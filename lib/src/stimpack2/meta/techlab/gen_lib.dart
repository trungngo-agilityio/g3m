part of g3.stimpack2.meta.techlab;

class StimGenMetaPack implements Node {
  final StimModelPackage pack;

  StimpackCodeConfig _config;

  /// The external packs referred by this pack.
  /// This can be determined by figure out the types user by the other
  /// package.
  Set<StimModelPackage> _externalPacks;

  /// The external types used.
  Set<StimModelType> _externalTypes;

  StimGenMetaPack(this.pack);

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
      package: _config.codePackageLibraryOf(pack),
      parts: _parts(),
      imports: _imports(),
      body: _extension(),
      classes: [
        // The internal implementation.
        _typeClass(),
      ],
    );
  }

  void _preBuild(BuildContext context) {
    _config = context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();
    _externalPacks = <StimModelPackage>{};
    _externalTypes = <StimModelType>{};

    // Finds all external packs that this pack depends on.
    for (final type in pack.types) {
      if (type.fields == null) continue;

      for (final field in type.fields) {
        final fieldTypePack = field.type?.package;
        if (fieldTypePack != pack) {
          _externalPacks.add(fieldTypePack);
          _externalTypes.add(field.type);
        }
      }
    }
  }

  /// Builds the list of code imports.
  ///
  List<CodeImport> _imports() {
    final imports = <CodeImport>[
      // imports the base stimpack
      CodeImport.of(path: 'package:g3m/stimpack2_core.dart'),
      // Imports additional package refers by this package.
    ];

    // Imports all external packs
    for (final externalPack in _externalPacks.toSet()) {
      imports.add(_config.codePackImportOf(externalPack));
    }

    return imports;
  }

  /// Builds the list of parts to be included into this library dart file.
  /// These parts are generated via [StimGenMetaType], [StimGenMetaPreset],
  /// and [StimGenMetaTypeField].
  ///
  List<String> _parts() {
    final parts = <String>[];
    parts.add('../' + _config.initPackFileNameOf(pack).toString());

    for (final i in pack.types) {
      // Includes the type definition file
      parts.add(_config.typeFileNameOf(pack, i));
    }

    return parts;
  }

  /// Generates an implementation for the abstract pack class (generated by
  /// [_abstractTypeClass] function.)
  ///
  CodeClass _typeClass() {
    // ------------------------------------------------------------------------
    // fields & properties
    // ------------------------------------------------------------------------

    // Private meta field
    final metaField =
        CodeField.of(name: 'meta', type: 'stim meta pack', isPrivate: true);

    // This is the list of fields to be generated in the class.
    final fields = <CodeField>[metaField];

    // This is the list of properties to be generated in the class.
    final properties = <CodeProperty>[];

    // This is the array of scopes init expressions, to be putted inside
    // the class constructor.
    final scopeFieldInitExprList = <Node>[];

    // This is the array of field init expressions, to be putted inside
    // the void init() function.
    final fieldInitFunctionCallList = <Node>[];

    // Loops through all types in the pack, for each type, generate
    // a field for the scope implementation, a property for readonly
    // scope access. An example of property is [_StimMetaMetaImpl._type]
    // and [_StimMetaMetaImpl.type].
    //
    for (final type in pack.types) {
      var scopeImplClass = _config.scopeClassNameOf(pack, type);
      final field = CodeField.of(
        name: type.name,
        type: scopeImplClass,
        isFinal: true,
      );

      fields.add(field);

      // Adds an expression to invoke constructor to create scope fields.
      scopeFieldInitExprList.add(CodeAssignExpr.of(
          field.name, CodeConstructorCall.of(className: scopeImplClass)));
    }

    // ------------------------------------------------------------------------
    // constructors
    // ------------------------------------------------------------------------

    // The constructor just need to create all scopes.
    final initPackFunctionName = _config.initPackFunctionNameOf(pack);
    final constructor = CodeConstructor.of(init: [
      ...scopeFieldInitExprList,
      CodeFunctionCall.ofSuper(args: CodeStringLiteral.of(pack.name)),
    ], body: [
      ...fieldInitFunctionCallList,
      '_buildMeta();\n',
      CodeFunctionCall.of(name: initPackFunctionName, args: CodeRef.ofThis()),
    ]);

    // ------------------------------------------------------------------------
    // _buildMeta() function
    // ------------------------------------------------------------------------

    final buildMetaFunction = CodeFunction.of(
      name: 'build meta',
      isPrivate: true,
      returns: 'void',
      body: _buildMetaFunctionBody(_config),
    );

    // ------------------------------------------------------------------------
    // Generates final class.
    // ------------------------------------------------------------------------

    return CodeClass.of(
      name: _config.packClassNameOf(pack),
      extend: 'stim pack',
      fields: fields,
      properties: properties,
      constructors: constructor,
      functions: [
        buildMetaFunction,
      ],
    );
  }

  Node _buildMetaFunctionBody(StimpackCodeConfig config) {
    final nodes = <Node>[
      Container([
        pack.name.toString() == 'model'
            ? 'final m = this;\n'
            : 'final m = stimpack.model;\n',
        'final pack = model.package.of(\'${pack.name.camel()}\');\n',
        'final f = m.field, t = m.type;\n',
        '\n',
      ]),
    ];

    final typeDefs = <Node>[];
    final buildFields = <Node>[];

    for (final type in pack.types) {
      final typeOfCall = CodeAccessExpr.of(
          CodeRef.of('t'),
          CodeFunctionCall.of(
            name: 'of',
          ));
      // stop if this field does not have and fields.

      final typeVar = CodeAccessExpr.of(CodeRef.of('xt'), type.name.camel());

      typeDefs.add(CodeAssignExpr.of(typeVar, typeOfCall));

      if (type.fields?.isNotEmpty != true) continue;

      final fieldDefs = <Node>[];

      for (final field in type.fields) {
        final fieldName = field.name;
        final fieldTypeName =
            _config.publicMetaTypeName(pack, field.type, prefix: 't');

        final fieldDef = Container([
          '\nf.of(\'',
          fieldName.camel(),
          '\'',
          ', type: ',
          fieldTypeName,
          ')',
        ]);

        fieldDefs.add(fieldDef);
      }

      buildFields.add(Container([
        'xt.',
        type.name.camel(),
        '.fields = {\n',
        Indent(Join.commaNewLineSeparated(fieldDefs.toList()), level: 2),
        '};\n\n',
      ]));
    }

    nodes.add(
      Text.of('_meta = pack;\n'),
    );

    return Container([
      ...nodes,
      ...typeDefs,
      ...buildFields,
    ]);
  }

  Node _extension() {
    // TODO: Fix this after extension support
    final template = ''' 
{{ packClass }}  _{{ packClass.camel }};

extension {{ packClass }}StimpackExtension on Stimpack {
  {{ packClass }} get {{ packName.camel }} => _{{ packClass.camel }} ?? {{ packClass}}();
}
    ''';
    return Mustache.template(template, values: {
      'packName': pack.name.camel(),
      'packClass': _config.packClassNameOf(pack),
    });
  }
}
