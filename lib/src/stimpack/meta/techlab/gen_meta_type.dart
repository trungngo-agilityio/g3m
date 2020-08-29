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

    return DartCodeFile.of(
      fileName,
      package: config.codePackageLibraryOf(pack, isPart: true),
      classes: [
        _symbolClass(config),
        _symbolSetClass(config),
        _abstractScopeClass(config),
        _implementScopeClass(config),
      ],
      body: _buildBody(config),
    );
  }

  CodeClass _symbolClass(StimpackCodeConfig config) {
    final symbolClass = config.symbolClassNameOf(pack, type);
    final symbolSetClass = config.symbolSetClassNameOf(pack, type);
    final baseSymbolClass = CodeType.of(
        name: 'stim symbol', generic: [symbolClass, symbolSetClass]);

    final fields = <CodeField>[];
    final fieldCloneList = <Node>[];
    for (final field in type.fields) {
      final fieldClass = config.symbolClassNameOf(pack, field.type);
      fields.add(CodeField.of(name: field.name, type: fieldClass));

      fieldCloneList.add(
        CodeCascade.of(
          CodeAssignExpr.of(
            field.name,
            CodeAccessExpr.of(
              field.name,
              CodeFunctionCall.of(name: 'clone'),
            ),
          ),
        ),
      );
    }

    var scopeArg = CodeArg.of(
      name: 'scope',
      type: config.typeScopeImplClassNameOf(pack, type),
    );

    // Creates a constructor that accepts a scope argument.
    final constructor = CodeConstructor.of(
      requiredArgs: scopeArg,
      init: CodeFunctionCall.of(name: 'super', args: CodeRef.of(scopeArg)),
    );

    final cloneFunction = CodeFunction.of(
      name: 'clone',
      isOverride: true,
      returns: symbolClass,
      body: CodeReturn.of(Container([
        'super.clone()\n',
        Indent(Join.newLineSeparated(fieldCloneList), level: 2),
      ])),
    );

    return CodeClass.of(
      name: symbolClass,
      extend: baseSymbolClass,
      fields: fields,
      constructors: constructor,
      functions: [cloneFunction],
    );
  }

  CodeClass _symbolSetClass(StimpackCodeConfig config) {
    final symbolClass = config.symbolClassNameOf(pack, type);
    final symbolSetClass = config.symbolSetClassNameOf(pack, type);

    final baseSymbolSetClass = CodeType.of(
        name: 'stim symbol set', generic: [symbolClass, symbolSetClass]);

    final packField = CodeField.of(
      name: 'pack',
      type: config.packImplClassNameOf(pack),
      isPrivate: true,
      isFinal: true,
    );

    final fields = <CodeField>[packField];

    final packFieldArg = CodeArg.ofField(field: packField);

    final itemsArg = CodeArg.of(
        name: 'items',
        type: CodeType.of(
          name: symbolClass,
          array: true,
        ));

    final symbolScopeFieldName =
        CodeFieldName.of(name: type.name, isPrivate: true);
    
    final constructor = CodeConstructor.of(
      requiredArgs: [
        packFieldArg,
        itemsArg,
      ],
      init: CodeFunctionCall.ofSuper(args: [
        CodeAccessExpr.of(packField.name, symbolScopeFieldName),
        CodeRef.of(itemsArg),
      ]),
    );

    return CodeClass.of(
      name: symbolSetClass,
      extend: baseSymbolSetClass,
      fields: fields,
      constructors: constructor,
    );
  }

  CodeClass _abstractScopeClass(StimpackCodeConfig config) {
    return null;
  }

  CodeClass _implementScopeClass(StimpackCodeConfig config) {
    return null;
  }

  Node _buildBody(StimpackCodeConfig config) {
    final template = '''

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
{{{ typePresetClasses }}}
        
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
        'fieldListDef': _buildFieldListDef(config),
        'fieldListClone': _buildFieldListClone(),
        'fieldListClear': _buildFieldListClear(),
        'fieldListInit': _buildFieldListInit(),
        'setFieldListDef': _buildSetFieldListDef(),
        'typePresetClasses': _typePresetClasses(config),
        'symbolClassFields': _symbolClassFields(config),
        'symbolClassFieldsInit': _symbolClassFieldsInit(),
        'ofFunctionArgs': _buildOfFunctionArgs(),
      },
      pack: pack,
      type: type,
    );
  }

  String _buildFieldListDef(StimpackCodeConfig config) {
    return type.fields
        .map((field) {
          var name = config.symbolClassNameOf(pack, field.type);
          var s = '';
          if (field.isSet) {
            s = 'Set';
          }
          return '$name ${field.name.camel()};';
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
            .map((field) {
              final f = field.name.camel();
              final t = field.type.name.camel();
              final s = '      ..${f} = __pack.${t}';
              if (field.isSet) {
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
              if (e.isSet) {
                return '$s1 += $s2.noneSet';
              } else {
                return '$s1 = $s2.none';
              }
            })
            .join('\n')
            .toString() +
        ';';
  }

  Node _typePresetClasses(StimpackCodeConfig config) {
    final presets = type.presets
        // gets out the preset does not have empty name.
        .whereHasName()
        // converts the preset to a class with its fields are the
        // preset values.
        .map((preset) {
      final name = config.presetClassNameOf(pack, type, preset);
      final fieldType = config.symbolClassNameOf(pack, type);

      var fields = preset.values
          .map((e) => CodeField.of(
                name: e.name.camel(),
                type: fieldType,
              ))
          .toList();

      // Generates an all field that will be the combine of all other values.
      fields.add(
        CodeField.of(
          name: 'all',
          type: config.symbolSetClassNameOf(pack, type),
        ),
      );

      final scopeArg = CodeArg.of(
        name: 'scope',
        type: config.typeScopeClassNameOf(pack, type),
      );

      final fieldInits = preset.values.whereHasName().map(
            (value) => CodeAssignExpr.of(
              value.name.camel(),
              CodeAccessExpr.of(
                scopeArg.name,
                CodeFunctionCall.of(
                    name: 'of', args: CodeStringLiteral.of(value.name)),
              ),
            ),
          );

      final constructor = CodeConstructor.of(
        requiredArgs: scopeArg,
        body: fieldInits.toList(),
      );

      return CodeClass.of(
        name: name,
        fields: fields,
        constructors: constructor,
      );
    }).toList();

    return Container(presets);
  }

  Node _buildSetFieldListDef() {
    final nodes = <Node>[];
    for (final field in type.fields) {
      String template;
      if (field.isSet) {
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
          field: field,
        ),
      );
    }

    return Container(nodes);
  }

  Node _symbolClassFieldsInit() {
    final children = <Node>[];
    for (final i in type.presets) {
      if (i.name.toString().isNotEmpty == true) {
        // This preset has name.

      } else {
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

  Node _symbolClassFields(StimpackCodeConfig config) {
    final presetFields = type.presets.whereHasName().map((preset) {
      final fieldType = config.presetClassNameOf(pack, type, preset);

      // Generates a field that hold the preset class
      final field = CodeField.of(
        isPrivate: true,
        name: preset.name.camel(),
        type: fieldType,
      );

      // Generates a getter that lazy init and return the preset class
      final property = CodeProperty.of(
        name: preset.name.camel(),
        type: fieldType,
        getter: CodeReturn.of(
          CodeAssignIfNullExpr.of(
            field.name,
            CodeConstructorCall.of(
                className: fieldType, args: CodeRef.of('_scope')),
          ),
        ),
      );

      return Container([field, property]);
    });

    final valueFields =
        type.presets.whereNoName().map((e) => _presetClassFields(e));

    return Indent(Container([
      '\n',
      Container(presetFields),
      '\n',
      Container(valueFields),
    ]));
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
