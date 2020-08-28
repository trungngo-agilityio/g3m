part of g3.stimpack.meta.techlab;

class StimGenMetaType implements Node {
  final StimMetaPack pack;
  final StimMetaType type;

  StimGenMetaType(this.pack, this.type);

  @override
  Node build(BuildContext context) {
    final config =
        context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();
    final fileName = config.typeFileNameOf(pack, type);
    return DartCodeFile.of(fileName, body: _buildBody());
  }

  Node _buildBody() {
    final template = '''
part of g3.stimpack.{{ packName.camel }}.generated;

class {{ typeClass }} extends StimSymbol<{{ typeClass }}, {{ typeSetClass }} > {
{{ fieldListDef }}

  {{ typeClass }}._({{ typeScopeImplClass }} scope)
      : super(scope);

  @override
  {{ typeClass }} clone() {
    return super.clone()
{{ fieldListClone }}    
  }
}

class {{ typeSetClass }}
    extends StimSymbolSet<{{ typeClass }}, {{ typeSetClass }}> {
  final {{ packImplClass }} __pack;

  
  {{ typeSetClass }}._(this.__pack, List<{{ typeClass }}> items)
      : super(__pack._{{ typeName.camel }}, items);

{{{setFieldListDef}}}
}

abstract class {{ typeScopeClass }}
    extends StimScope<{{ typeClass }}, {{ typeSetClass }}> {
    
  {{ typeSymbolsClass }} get s;
    
  {{ typeClass }} of({{ ofFunctionArgs }});
}

'''
        // Symbols preset
        '''
class {{ typeSymbolsClass }} {
  final {{ typeScopeImplClass }} _scope;
  /// All symbols
  {{ typeSetClass }} all;
{{{ symbolClassFields }}}
  
  {{ typeSymbolsClass }}(this._scope) {
    final _s = stimpack.{{ packName.camel }}.{{ typeName.camel }};
    all = _s.noneSet;
{{{ symbolClassFieldsInit }}}
  }
}

'''
        // Scope implementation class.
        '''
class {{ typeScopeImplClass }} 
    extends StimScopeImpl<{{ typeClass }}, {{ typeSetClass }}>
    implements {{ typeScopeClass }} {
  final {{ packImplClass }} __pack;
  
  {{ typeScopeImplClass }}._(this.__pack) : super();

'''
        // Scope symbols
        '''
  {{ typeSymbolsClass }} _s;

  @override
  {{ typeSymbolsClass }} get s => _s ??= {{ typeSymbolsClass }}(this);
'''
        // clear function, to reset a symbol
        '''
  @override
  void clear({{ typeClass }} symbol) {
{{ fieldListClear }}    
  }

  @override
  {{ typeClass }} create() => {{ typeClass }}._(this);

  @override
  {{ typeClass }} of({{ ofFunctionArgs }}) {
    return createAndClear(name)
{{ fieldListInit }}    
  }

  @override
  {{ typeSetClass }} createSet(List<{{ typeClass }}> items) {
    return {{ typeSetClass }}._(__pack, items);
  }
}
    ''';

    return StimGenMetaTemplate(
      template,
      {
        'fieldListDef': _buildFieldListDef(),
        'fieldListClone': _buildFieldListClone(),
        'fieldListClear': _buildFieldListClear(),
        'fieldListInit': _buildFieldListInit(),
        'setFieldListDef': _buildSetFieldListDef(),
        'symbolClassFields': _symbolClassFields(),
        'symbolClassFieldsInit': _symbolClassFieldsInit(),
        'ofFunctionArgs': _buildOfFunctionArgs(),
      },
      pack: pack,
      type: type,
    );
  }

  String _buildFieldListDef() {
    return type.fields
        .map((e) {
          var s = '';
          if (e.kind == stimpack.meta.kind.s.list) {
            s = 'Set';
          }
          return '  Stim${pack.name.pascal()}${e.type.name.pascal()}${s} ${e.name.camel()};';
        })
        .join('\n')
        .toString();
  }

  String _buildFieldListClone() {
    return type.fields
            .map((e) {
              return '      ..${e.name.camel()} = ${e.name.camel()}.clone()';
            })
            .join('\n')
            .toString() +
        ';';
  }

  String _buildFieldListClear() {
    if (type.fields.isEmpty) {
      return '';
    }

    return '    symbol\n' +
        type.fields
            .map((e) {
              final f = e.name.camel();
              final t = e.type.name.camel();
              final s = '      ..${f} = __pack.${t}';
              if (e.kind == stimpack.meta.kind.s.list) {
                return '${s}.noneSet';
              } else {
                return '${s}.none';
              }
            })
            .join('\n')
            .toString() +
        ';';
  }

  String _buildFieldListInit() {
    return type.fields
            .map((e) {
              // Field name
              final f = e.name.camel();

              // Type name
              final t = e.type.name.camel();

              final s1 = '      ..${f}';
              final s2 = '${f} ?? __pack.${t}';
              if (e.kind == stimpack.meta.kind.s.list) {
                return '$s1 += $s2.noneSet';
              } else {
                return '$s1 = $s2.none';
              }
            })
            .join('\n')
            .toString() +
        ';';
  }

  Node _buildSetFieldListDef() {
    final nodes = <Node>[];
    for (final i in type.fields) {
      String template;
      if (i.kind == stimpack.meta.kind.s.list) {
        template = '''
        
        
  {{ setOpClass }} _{{ fieldName.camel }};

  {{ setOpClass }} get {{ fieldTypeName.camel }} =>
      _{{ fieldName.camel }} ??= {{ setOpClass }}(this, __pack.{{ fieldTypeName.camel }});

  set {{ fieldName.camel}}({{ setOpClass }} value) => _{{ fieldName.camel }} = value;
        ''';
      } else {
        template = '''
         
         
  {{ setOpClass }} _{{ fieldName.camel }};

  {{ setOpClass }} get {{ fieldName.camel }} =>
      _{{ fieldName.camel }} ??= {{ setOpClass }}(this, __pack.{{ fieldTypeName.camel }});

  set {{ fieldName.camel }}({{ setOpClass}} value) => _{{ fieldName.camel }} = value;
        ''';
      }

      nodes.add(
        StimGenMetaTemplate(
          template,
          null,
          pack: pack,
          type: type,
          field: i,
        ),
      );
    }

    return Container(nodes);
  }

  Node _symbolClassFieldsInit() {
    final children = <Node>[];
    for (final i in type.presets) {
      if (i.name.toString().isNotEmpty == true) {
        print('here name not null');
        // This preset has name.

      } else {
        print('here');
        // This preset do not have name.
        // render it as the symbols level.
        children.add(_symbolClassFieldsPresetInit(i));
      }
    }

    return Container(children);
  }

  Node _symbolClassFieldsPresetInit(StimMetaPreset preset) {
    final children = preset.values.map((value) {
      return '''
    all += ${value.name.camel()} = _scope.of('${value.name}');''';
    });

    return Text.of(children.join('\n'));
  }

  Node _symbolClassFields() {
    final children = <Node>[];
    for (final i in type.presets) {
      if (i.name.toString().isNotEmpty == true) {
        // This preset has name.

      } else {
        // This preset do not have name.
        // render it as the symbols level.
        children.add(_presetClassFields(i));
      }
    }

    return Container(children);
  }

  Node _presetClassFields(StimMetaPreset preset) {
    final children = preset.values.map((value) {
      final template = '''
  {{ typeClass }} {{ valueName.camel }};
''';
      return StimGenMetaTemplate(template, {},
          pack: pack, type: type, preset: preset, value: value);
    });

    return Container(children.toList());
  }

  Node _buildOfFunctionArgs() {
    return CodeArgList.of(
      required: [
        ['name', 'dynamic']
      ],
      named: type.fields
          .map(
            (e) => [e.name, 'dynamic'],
          )
          .toList(),
    );
  }
}
