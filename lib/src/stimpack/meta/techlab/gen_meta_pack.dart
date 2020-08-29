part of g3.stimpack.meta.techlab;

class StimGenMetaPack implements Node {
  final StimMetaPack pack;

  StimGenMetaPack(this.pack);

  @override
  Node build(BuildContext context) {
    final config =
        context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();
    final fileName = config.packFileNameOf(pack);
    return DartCodeFile.of(
      fileName,
      package: config.codePackageLibraryOf(pack),
      parts: _parts(config),
      imports: _imports(config),
      body: _extension(config),
      classes: [
        // The abstract class that provides the pack public interface.
        _abstractTypeClass(config),

        // The internal implementation.
        _typeClass(config),
      ],
    );
  }

  /// Builds the list of code imports.
  ///
  List<CodeImport> _imports(StimpackCodeConfig config) {
    final imports = <CodeImport>[
      // imports the base stimpack
      CodeImport.of(path: 'package:g3m/stimpack_base.dart'),
      // Imports additional package refers by this package.
    ];

    final externalPacks = <StimMetaPack>{};

    // Finds all external packs that this pack depends on.
    for (final type in pack.types) {
      for (final field in type.fields) {
        final fieldTypePack = field.type?.pack;
        if (fieldTypePack != null && fieldTypePack != pack) {
          externalPacks.add(fieldTypePack);
        }
      }
    }

    // Imports the meta package if the current package is not meta
    if (pack.name.camel().toString() != 'meta') {
      externalPacks.add(stimpack.meta.meta);
    }

    // Imports all external packs
    for (final externalPack in externalPacks.toSet()) {
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
        type: config.typeScopeClassNameOf(pack, type),
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
    final thisRef = CodeRef.ofThis();
    final initFunctionCall = CodeFunctionCall.of(name: 'init');

    for (final type in pack.types) {
      var scopeImplClass = config.typeScopeImplClassNameOf(pack, type);
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
      scopeFieldInitExprList.add(CodeAssignExpr.of(field.name,
          CodeConstructorCall.of(className: scopeImplClass, args: thisRef)));

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
      CodeFunctionCall.of(name: buildMetaFunction),
      CodeFunctionCall.of(name: buildValuesFunction),
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
    final nodes = <Node>[
      Container([
        pack.name.toString() == 'meta'
            ? 'final meta = this;\n'
            : 'final meta = stimpack.meta;\n',
        'final f = meta.field, t = meta.type, p = meta.preset, v = meta.value;\n',
        'final listKind = meta.kind.s.list;\n',
        '\n',
      ]),
    ];

    // Builds the model definitions
    for (final i in pack.types) {
      final t = i.name.camel();
      nodes.add(
        Container([
          'final ',
          t,
          'Type = t.of(\'',
          t,
          '\');\n',
        ]),
      );
    }

    nodes.add(NewLine());

    // Builds the type field.
    for (final i in pack.types) {
      final t = i.name.camel();
      if (i.fields.isEmpty) continue;
      var fieldDefs = i.fields.map((e) {
        final fieldName = e.name.camel().toString();
        final typeName = e.type.name.camel().toString() + 'Type';
        final isList = e.kind == stimpack.meta.kind.s.list;

        return Container([
          '\nf.of(\'',
          fieldName,
          '\'',
          isList ? Text.of(', kind: listKind') : null,
          ', type: ',
          typeName,
          ')',
        ]);
      });
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
    for (final i in pack.types) {
      final t = i.name.camel();
      if (i.presets.isEmpty) continue;

      final presetDefs = i.presets.map((preset) {
        final presetName = preset.name.camel().toString();

        final valueDefs = preset.values.map((value) {
          return Container([
            '\nv.of(\'',
            value.name,
            '\')',
          ]);
        });

        return Container([
          '\np.of(\'',
          presetName,
          '\', values: \n',
          Indent(
              Join.of(
                ' + ',
                valueDefs.toList(),
              ),
              level: 3),
          ',)\n',
        ]);
      });

      nodes.add(Container([
        t,
        'Type.presets += \n',
        Indent(
            Join.of(
              ' + ',
              presetDefs.toList(),
            ),
            level: 2),
        ';\n\n',
      ]));
    }

    // Builds the final meta
    final types = pack.types.map((e) {
      return Text.of(e.name.camel().toString() + 'Type');
    }).toList();

    nodes.add(
      Container([
        'final allTypes = ',
        Join.of(' + ', types),
        ');\n',
      ]),
    );

    nodes.add(Container([
      '_meta = meta.pack.of(\'',
      pack.name.camel(),
      '\', types: allTypes);\n',
    ]));

    nodes.add(
      Text.of('allTypes.pack.set(_meta);\n'),
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
