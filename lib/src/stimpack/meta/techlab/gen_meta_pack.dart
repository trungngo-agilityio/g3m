part of g3.stimpack.meta.techlab;

class StimGenMetaPack implements Node {
  final StimMetaPack pack;

  StimGenMetaPack(this.pack);

  @override
  Node build(BuildContext context) {
    final config =
        context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();
    final fileName = config.packFileNameOf(pack);
    return DartCodeFile.of(fileName, body: _buildBody(config));
  }

  Node _buildBody(StimpackCodeConfig config) {
    final template = ''' 
library g3.stimpack.{{ packName.camel }}.generated;

import 'package:g3m/stimpack_base.dart';
{{{ metaImport }}}

{{{ partOfList }}}

{{ packClass }}  _{{ packClass.camel }};

'''

        /// Extension on stim pack to inject the pack getter.
        '''
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

'''
        // Abstract pack class that provides getters to all symbol scope.
        '''
abstract class {{ packClass }} {
  StimMetaPack get meta;

{{{ packClassFields }}}
}

class {{ packImplClass }} implements {{ packClass }} {
  StimMetaPack _meta;

{{{packImplClassFields}}}

  @override
  StimMetaPack get meta => _meta;

{{{ packImplClassScopeFields }}}
'''
        // Constructor
        '''
  {{ packImplClass }}() {
{{{ packImplClassConstructorFieldSet }}}
  }
  
  void init() {
{{{ packImplClassInitFunctionFieldSet }}}
    _buildMeta();
  }

  void _buildMeta() {
{{{ buildMetaFunction }}}
  }
}
    ''';

    final metaImport = pack.name.toString() == 'meta'
        ? ''
        : '''import 'package:g3m/stimpack_meta.dart';''';

    return StimGenMetaTemplate(
        template,
        {
          'metaImport': metaImport,
          'partOfList': _buildPartOfList(config),
          'packClassFields': _packClassFields(config),
          'packImplClassFields': _packImplClassFields(config),
          'packImplClassScopeFields': _packImplClassScopeFields(config),
          'packImplClassConstructorFieldSet':
              _packImplClassConstructorFieldSet(config),
          'packImplClassInitFunctionFieldSet':
              _packImplClassInitFunctionFieldSet(config),
          'buildMetaFunction': _buildMetaFunction(config),
        },
        pack: pack);
  }

  Node _buildPartOfList(StimpackCodeConfig config) {
    final nodes = <Node>[];

    for (final i in pack.types) {
      // Includes the type definition file
      nodes.add(_buildPartOf(config.typeFileNameOf(pack, i)));

      for (final j in i.fields) {
        // Include the type field definition file.
        nodes.add(_buildPartOf(config.typeFieldFileNameOf(pack, i, j)));
      }
    }

    return Container(nodes);
  }

  Node _buildPartOf(String path) {
    return Container([
      'part ',
      Pad.singleQuotes(Container([path, '.dart'])),
      ';\n\n'
    ]);
  }

  Node _buildMetaFunction(StimpackCodeConfig config) {
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

    nodes.add(Container([
      '_meta = meta.pack.of(\'',
      pack.name.camel(),
      '\', types: ',
      Join.of(' + ', types),
      ');\n',
    ]));

    return Indent(Container(nodes), level: 2);
  }

  Node _packClassFields(StimpackCodeConfig config) {
    final template = '''
  {{ typeScopeClass }} get {{ typeName.camel }};
''';
    return Container(pack.types
        .map((e) => StimGenMetaTemplate(
              template,
              null,
              pack: pack,
              type: e,
            ))
        .toList());
  }

  Node _packImplClassFields(StimpackCodeConfig config) {
    final template = '''
  
  {{ typeScopeImplClass }} _{{ typeName.camel }};
''';
    return Container(pack.types
        .map((e) => StimGenMetaTemplate(
              template,
              null,
              pack: pack,
              type: e,
            ))
        .toList());
  }

  Node _packImplClassScopeFields(StimpackCodeConfig config) {
    final template = '''
  
  @override
  {{ typeScopeClass }} get {{ typeName.camel }} => _{{ typeName.camel }};
''';
    return Container(pack.types
        .map((e) => StimGenMetaTemplate(
              template,
              null,
              pack: pack,
              type: e,
            ))
        .toList());
  }

  Node _packImplClassConstructorFieldSet(StimpackCodeConfig config) {
    final template = '''
    _{{ typeName.camel }} = {{ typeScopeImplClass }}._(this);
''';
    return Container(pack.types
        .map((e) => StimGenMetaTemplate(
              template,
              null,
              pack: pack,
              type: e,
            ))
        .toList());
  }

  Node _packImplClassInitFunctionFieldSet(StimpackCodeConfig config) {
    final template = '''
    _{{ typeName.camel }}.init();
''';
    return Container(pack.types
        .map((e) => StimGenMetaTemplate(
              template,
              null,
              pack: pack,
              type: e,
            ))
        .toList());
  }
}
