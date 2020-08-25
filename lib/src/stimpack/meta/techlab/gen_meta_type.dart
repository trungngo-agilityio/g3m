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
part of g3.stimpack.{{ packNameCamel }}.generated;

class Stim{{ packNamePascal }}{{ typeNamePascal }} extends StimSymbol<Stim{{ packNamePascal }}{{ typeNamePascal }}, Stim{{ packNamePascal }}{{ typeNamePascal }}Set> {
{{ fieldListDef }}

  Stim{{ packNamePascal }}{{ typeNamePascal }}._(StimScopeImpl<Stim{{ packNamePascal }}{{ typeNamePascal }}, Stim{{ packNamePascal }}{{ typeNamePascal }}Set> scope)
      : super(scope);

  @override
  Stim{{ packNamePascal }}{{ typeNamePascal }} clone() {
    return super.clone()
{{ fieldListClone }}    
  }
}

class Stim{{ packNamePascal }}{{ typeNamePascal }}Set
    extends StimSymbolSet<Stim{{ packNamePascal }}{{ typeNamePascal }}, Stim{{ packNamePascal }}{{ typeNamePascal }}Set> {
  final _Stim{{ packNamePascal }}PackImpl _pack;

  Stim{{ packNamePascal }}{{ typeNamePascal }}Set._(this._pack, List<Stim{{ packNamePascal }}{{ typeNamePascal }}> items)
      : super(_pack._{{ typeNameCamel }}, items);

{{{setFieldListDef}}}
}

abstract class _Stim{{ packNamePascal }}{{ typeNamePascal }}Scope
    extends StimScope<Stim{{ packNamePascal }}{{ typeNamePascal }}, Stim{{ packNamePascal }}{{ typeNamePascal }}Set> {
  Stim{{ packNamePascal }}{{ typeNamePascal }} of({{ ofFunctionArgs }});
}

class _Stim{{ packNamePascal }}{{ typeNamePascal }}ScopeImpl
    extends StimScopeImpl<Stim{{ packNamePascal }}{{ typeNamePascal }}, Stim{{ packNamePascal }}{{ typeNamePascal }}Set>
    implements _Stim{{ packNamePascal }}{{ typeNamePascal }}Scope {
  final _Stim{{ packNamePascal }}PackImpl _pack;

  _Stim{{ packNamePascal }}{{ typeNamePascal }}ScopeImpl._(this._pack) : super();

  @override
  void clear(Stim{{ packNamePascal }}{{ typeNamePascal }} symbol) {
    symbol
{{ fieldListClear }}    
  }

  @override
  Stim{{ packNamePascal }}{{ typeNamePascal }} create() => Stim{{ packNamePascal }}{{ typeNamePascal }}._(this);

  @override
  Stim{{ packNamePascal }}{{ typeNamePascal }} of({{ ofFunctionArgs }}) {
    return createAndClear(name)
{{ fieldListInit }}    
  }

  @override
  Stim{{ packNamePascal }}{{ typeNamePascal }}Set createSet(List<Stim{{ packNamePascal }}{{ typeNamePascal }}> items) {
    return Stim{{ packNamePascal }}{{ typeNamePascal }}Set._(_pack, items);
  }
}
    ''';

    return Mustache.template(template, values: {
      'packNamePascal': pack.name.pascal(),
      'packNameCamel': pack.name.camel(),
      'typeNamePascal': type.name.pascal(),
      'typeNameCamel': type.name.camel(),
      'fieldListDef': _buildFieldListDef(),
      'fieldListClone': _buildFieldListClone(),
      'fieldListClear': _buildFieldListClear(),
      'fieldListInit': _buildFieldListInit(),
      'setFieldListDef': _buildSetFieldListDef(),
      'ofFunctionArgs': _buildOfFunctionArgs(),
    });
  }

  String _buildFieldListDef() {
    return type.fields
        .map((e) {
          var s = '';
          if (e.kind == stimpack.meta.kind.list) {
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
    return type.fields
            .map((e) {
              final f = e.name.camel();
              final t = e.type.name.camel();
              final s = '      ..${f} = _pack.${t}';

              if (e.kind == stimpack.meta.kind.list) {
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

              final s = '      ..${f} = ${f} ?? _pack.${t}';
              if (e.kind == stimpack.meta.kind.list) {
                return '$s.noneSet';
              } else {
                return '$s.none';
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
      if (i.kind == stimpack.meta.kind.list) {
        template = '''
        
        
  _Stim{{ packNamePascal }}{{ typeNamePascal }}_{{ fieldTypePascal }}SetOp _{{ fieldNameCamel }};

  _Stim{{ packNamePascal }}{{ typeNamePascal }}_{{ fieldTypePascal }}SetOp get {{ fieldNameCamel }} =>
      _{{ fieldNameCamel }} ??= _Stim{{ packNamePascal }}{{ typeNamePascal }}_{{ fieldTypePascal }}SetOp(this, _pack.{{ fieldTypeCamel }});

  set {{ fieldNameCamel }}(_Stim{{ packNamePascal }}{{ typeNamePascal }}_{{ fieldTypePascal }}SetOp value) => _{{ fieldNameCamel }} = value;
        ''';
      } else {
        template = '''
         
         
  _Stim{{ packNamePascal }}{{ typeNamePascal }}_{{ fieldTypePascal }}Op _{{ fieldNameCamel }};

  _Stim{{ packNamePascal }}{{ typeNamePascal }}_{{ fieldTypePascal }}Op get {{ fieldNameCamel }} =>
      _{{ fieldNameCamel }} ??= _Stim{{ packNamePascal }}{{ typeNamePascal }}_{{ fieldTypePascal }}Op(this, _pack.{{ fieldTypeCamel }});

  set {{ fieldNameCamel }}(_Stim{{ packNamePascal }}{{ typeNamePascal }}_{{ fieldTypePascal }}Op value) => _{{ fieldNameCamel }} = value;
        ''';
      }

      nodes.add(
        Mustache.template(template, values: {
          'packNamePascal': pack.name.pascal(),
          'packNameCamel': pack.name.camel(),
          'typeNamePascal': type.name.pascal(),
          'typeNameCamel': type.name.camel(),
          'fieldNamePascal': i.name.pascal(),
          'fieldNameCamel': i.name.camel(),
          'fieldTypePascal': i.type.name.pascal(),
          'fieldTypeCamel': i.type.name.camel(),
        }),
      );
    }

    return Container(nodes);
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
