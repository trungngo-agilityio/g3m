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
library g3.stimpack.{{ packNameCamel }};

import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';

{{{ partOfList }}}

_Stim{{ packNamePascal }}PackImpl _stim{{ packNamePascal }}Pack;

extension Stim{{ packNamePascal }}PackExtension on Stimpack {
  _Stim{{ packNamePascal }}Pack get {{ packNameCamel }} {
    return _stim{{ packNamePascal }}Pack ??= _Stim{{ packNamePascal }}PackImpl();
  }
}

abstract class _Stim{{ packNamePascal }}Pack {
  StimMetaPack get meta;

{{# pack.types }}
  _Stim{{ packNamePascal }}{{# pascal }}{{ name }}{{/ pascal }}Scope get {{# camel }}{{ name }}{{/ camel }};
{{/ pack.types }}
}

class _Stim{{ packNamePascal }}PackImpl implements _Stim{{ packNamePascal }}Pack {
  StimMetaPack _meta;

{{# pack.types }}
  _Stim{{ packNamePascal }}{{# pascal }}{{ name }}{{/ pascal }}ScopeImpl _{{# camel }}{{ name }}{{/ camel }};
{{/ pack.types }}

  @override
  StimMetaPack get meta => _meta;

{{# pack.types }}
  @override
  _Stim{{ packNamePascal }}{{# pascal }}{{ name }}{{/ pascal }}Scope get {{# camel }}{{ name }}{{/ camel }} => _{{# camel }}{{ name }}{{/ camel }};
{{/ pack.types }}

  _Stim{{ packNamePascal }}PackImpl() {
{{# pack.types }}
    _{{# camel }}{{ name }}{{/ camel }} = _Stim{{ packNamePascal }}{{# pascal }}{{ name }}{{/ pascal }}ScopeImpl._(this);
{{/ pack.types }}

{{# pack.types }}
    _{{# camel }}{{ name }}{{/ camel }}.init();
{{/ pack.types }}

    _buildMeta();
  }

  void _buildMeta() {
{{{ buildMetaFunction }}}
  }
}
    ''';

    return Mustache.template(template, values: {
      'pack': pack,
      'packNameCamel': pack.name.camel(),
      'packNamePascal': pack.name.pascal(),
      'partOfList': _buildPartOfList(config),
      'buildMetaFunction': _buildMetaFunction(config),
    });
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
        'final meta = stimpack.meta;\n',
        'final listKind = meta.kind.list;\n',
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
          'Type = meta.type.of(\'',
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
        final isList = e.kind == stimpack.meta.kind.list;

        return Container([
          '\nmeta.field.of(\'',
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
}
