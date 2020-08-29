part of g3.stimpack.meta.techlab;

class StimGenMetaPack implements Node {
  final StimMetaPack pack;

  StimpackCodeConfig _config;
  Set<StimMetaPack> _externalPacks;
  Set<StimMetaType> _externalTypes;

  StimGenMetaPack(this.pack);

  @override
  Node build(BuildContext context) {
    _preBuild(context);

    final fileName = _config.packFileNameOf(pack);
    return DartCodeFile.of(
      fileName,
      package: _config.codePackageLibraryOf(pack),
      parts: _parts(_config),
      imports: _imports(_config),
      body: _extension(_config),
      classes: [
        // The abstract class that provides the pack public interface.
        _abstractTypeClass(_config),

        // The internal implementation.
        _typeClass(_config),
      ],
    );
  }

  void _preBuild(BuildContext context) {
    _config = context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();
    _externalPacks = <StimMetaPack>{};
    _externalTypes = <StimMetaType>{};

    // Finds all external packs that this pack depends on.
    for (final type in pack.types) {
      for (final field in type.fields) {
        final fieldTypePack = field.type?.pack;
        if (fieldTypePack != null && fieldTypePack != pack) {
          _externalPacks.add(fieldTypePack);
          _externalTypes.add(field.type);
        }
      }
    }

    // Removes all preset that points to meta pack.
    // This is forbidden.
    var presets = pack.presets.where((e) {
      return e.type.pack.name.camel().toString() != 'meta' ||
          e.type.name.camel().toString() != 'type';
    }).toSet();

    // Adds a new preset in to model the pack.
    final metaPreset = stimpack.meta.preset.ofValues(
        pack.name.camel().toString(),
        type: stimpack.meta.type.forMeta.type,
        values: pack.types.map((e) => e.name.camel().toString()).toList());

    presets.add(metaPreset);
    pack.presets.set(presets);
  }

  /// Builds the list of code imports.
  ///
  List<CodeImport> _imports(StimpackCodeConfig config) {
    final imports = <CodeImport>[
      // imports the base stimpack
      CodeImport.of(path: 'package:g3m/stimpack_base.dart'),
      // Imports additional package refers by this package.
    ];

    // Imports the meta package if the current package is not meta
    if (pack.name.camel().toString() != 'meta') {
      _externalPacks.add(stimpack.meta.meta);
    }

    // Imports all external packs
    for (final externalPack in _externalPacks.toSet()) {
      imports.add(config.codePackImportOf(externalPack));
    }

    return imports;
  }

  /// Builds the class that defines all getters to all scopes.
  CodeClass _abstractTypeClass(StimpackCodeConfig config) {
    final properties = <CodeProperty>[
      // FIX THIS, the meta preset should provide access to the pack instance
      CodeProperty.of(
          name: 'meta',
          type: 'stim meta pack',
          getter: CodePropertyGetter.of(body: null)),
    ];

    for (final type in pack.types) {
      properties.add(CodeProperty.of(
        name: type.name,
        type: config.scopeClassNameOf(pack, type),
        getter: CodePropertyGetter.of(body: null),
      ));
    }

    return CodeClass.of(
      name: config.packClassNameOf(pack),
      isAbstract: true,
      properties: properties,
    );
  }

  CodeClass _typeClass(StimpackCodeConfig config) {
    var metaField =
        CodeField.of(name: 'meta', type: 'stim meta pack', isPrivate: true);
    final fields = <CodeField>[metaField];
    final properties = <CodeProperty>[
      CodeProperty.ofField(field: metaField, isOverride: true, getter: true),
    ];

    final scopeFieldInitExprList = <Node>[];
    final fieldInitFunctionCallList = <Node>[];
    final initFunctionCall = CodeFunctionCall.of(name: 'init');

    for (final type in pack.types) {
      var scopeImplClass = config.scopeImplClassNameOf(pack, type);
      final field = CodeField.of(
        name: type.name,
        type: scopeImplClass,
        isPrivate: true,
      );

      final property = CodeProperty.ofField(
        field: field,
        isOverride: true,
        getter: true,
      );

      fields.add(field);
      properties.add(property);

      // Adds an expression to invoke constructor to create scope fields.
      scopeFieldInitExprList.add(CodeAssignExpr.of(
          field.name, CodeConstructorCall.of(className: scopeImplClass)));

      // Add an expression to invoke init function of scope fields.
      fieldInitFunctionCallList
          .add(CodeAccessExpr.of(field.name, initFunctionCall));
    }
    // The constructor just need to create all scopes.
    final constructor = CodeConstructor.of(
      body: scopeFieldInitExprList,
    );

    final buildMetaFunction = CodeFunction.of(
      name: 'build meta',
      isPrivate: true,
      returns: 'void',
      body: _buildMetaFunctionBody(config),
    );

    final buildValuesFunction = CodeFunction.of(
      name: 'buildValues',
      isPrivate: true,
      returns: 'void',
      comment: 'This function shall be call during the init process.',
      body: CodeComment.of(
        'build all preset values here',
      ),
    );

    final buildValuePlaceHolder = CodePlaceHolder.of(
      name: pack.name >> ' stimpack',
      body: Container([
        buildValuesFunction,
        '\n\n',
      ]),
    );

    final initFunction = CodeFunction.of(name: 'init', returns: 'void', body: [
      ...fieldInitFunctionCallList,
      '_buildMeta();\n',
      '_buildValues();\n',
    ]);

    return CodeClass.of(
      name: config.packImplClassNameOf(pack),
      implements: config.packClassNameOf(pack),
      fields: fields,
      properties: properties,
      constructors: constructor,
      functions: [
        initFunction,
        buildMetaFunction,
      ],
      body: buildValuePlaceHolder,
    );
  }

  List<String> _parts(StimpackCodeConfig config) {
    final parts = <String>[];
    parts.add(config.presetFileNameOf(pack));

    for (final i in pack.types) {
      // Includes the type definition file
      parts.add(config.typeFileNameOf(pack, i));

      for (final j in i.fields) {
        // Include the type field definition file.
        parts.add(config.typeFieldFileNameOf(pack, i, j));
      }
    }

    return parts;
  }

  Node _buildMetaFunctionBody(StimpackCodeConfig config) {
    final forPack = ('for' >> pack.name).camel();
    final nodes = <Node>[
      Container([
        pack.name.toString() == 'meta'
            ? 'final meta = this;\n'
            : 'final meta = stimpack.meta;\n',
        'final pack = stimpack.meta.pack.of(\'${pack.name.camel()}\');\n',
        'final f = meta.field, t = meta.type.${forPack}, p = meta.preset, v = meta.value;\n',
        'final listKind = meta.kind.forMeta.list;\n',
        '\n',
      ]),
    ];

    // Builds the model definitions
    for (final i in pack.types) {
      final varDef = CodeVar.of(
        name: i.name >> 'type',
        isFinal: true,
        init: CodeRef.of('t.${i.name.camel()}'),
      );
      nodes.add(varDef);
    }

    nodes.add(NewLine());

    // Builds the type field.
    for (final i in _externalTypes) {
      final typePack = i.pack;
      final name = (i.name >> 'type').camel();
      nodes.add(
        CodeVar.of(
          name: name,
          isFinal: true,
          init: CodeRef.of(
              'stimpack.${typePack.name.camel()}.meta.types.firstWhereNameIs(\'${i.name.camel()}\')'),
        ),
      );

      nodes.add(CodeFunctionCall.of(
          name: 'assert',
          args: [CodeNotEqualExpr.of(name, CodeNullLiteral())]));
    }

    for (final i in pack.types) {
      final t = i.name.camel();

      // stop if this field does not have and fields.
      if (i.fields.isEmpty) continue;

      final fieldDefs = <Node>[];

      for (final e in i.fields) {
        final fieldName = e.name;
        final typeName = e.type.name >> 'type';

        final fieldDef = Container([
          '\nf.of(\'',
          fieldName.camel(),
          '\'',
          e.isSet ? Text.of(', kind: listKind') : null,
          ', type: ',
          typeName.camel(),
          ')',
        ]);

        fieldDefs.add(fieldDef);
      }

      nodes.add(Container([
        t,
        'Type.fields += \n',
        Indent(
            Join.of(
              ' + ',
              fieldDefs.toList(),
            ),
            level: 2),
        ';\n\n',
      ]));
    }

    // Builds the type presets.
    final presetDefs = <Node>[];

    for (final i in pack.presets) {
      final presetName = i.name.camel();
      if (i.values.isNotEmpty != true) continue;
      final valueDefs = <Node>[];
      for (final j in i.values) {
        valueDefs.add(
          Container(['\nv.of(\'', j.name, '\')']),
        );
      }

      final type = i.type;
      final presetTypeName = _config.publicMetaTypeName(pack, type);
      final presetDef = Container([
        '\np.of(\'',
        presetName,
        '\', type: ${presetTypeName}, values: \n',
        Indent(
            Join.of(
              ' + ',
              valueDefs,
            ),
            level: 3),
        ',)\n',
      ]);

      presetDefs.add(presetDef);
    }

    if (presetDefs.isNotEmpty) {
      nodes.add(Container([
        'pack.presets += \n',
        Indent(Join.of(' + ', presetDefs.toList()), level: 2),
        ';\n\n',
      ]));
    }

    // Builds the final meta
    final packTypes = pack.types.map((e) {
      return Text.of(e.name.camel().toString() + 'Type');
    }).toList();

    nodes.add(
      Container([
        'pack.types += ',
        Join.of(' + ', packTypes),
        ';\n',
      ]),
    );

    nodes.add(
      Text.of('pack.types.pack.set(pack);\n'),
    );

    nodes.add(
      Text.of('_meta = pack;\n'),
    );

    return Container(nodes);
  }

  Node _extension(StimpackCodeConfig config) {
    // TODO: Fix this after extension support
    final template = ''' 
{{ packClass }}  _{{ packClass.camel }};

extension {{ packExtensionClass }} on Stimpack {
  {{ packClass }} get {{ packName.camel }} {
    if (_{{ packClass.camel }} == null) {
      final impl = _{{ packClass.camel }} = {{ packImplClass }}();
      impl.init();
      return _{{ packClass.camel }};
    }
    
    return _{{ packClass.camel }};
  }
}
    ''';

    return StimGenMetaTemplate(template, null, pack: pack);
  }
}
