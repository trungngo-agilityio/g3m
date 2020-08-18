import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_dart.dart';

class Scope implements Node {
  final Map<String, String> fields;
  final String isValidText;

  Scope({
    this.fields,
    this.isValidText,
  });

  @override
  Node build(BuildContext context) {
    final name = PromptResult.of(context)?.value('name');
    return Container([
      DartCodeFile.of(
        name,
        package: CodePackage.of('g3m core'),
        classes: [
          _exprClass(name),
          _scopeClass(name),
        ],
      ),
    ]);
  }

  CodeClass _exprClass(String name) {
    return CodeClass.of(
      name,
      extend: CodeType.genericSingle('expr', name),
      comment: 'This express provide abc',
      constructors: [
        CodeConstructor.of(requiredArgs: {
          'scope': 'action scope',
        }),
      ],
      body: Container([
        // For all the fields, build getters.
        _fieldGetters(),
        '\n',
        _isValidFunction(),
        '\n',
        _cloneFunction(),
      ]),
    );
  }

  CodeClass _scopeClass(String name) {
    return CodeClass.of(
      name,
      extend: CodeType.genericSingle('scope', name),
      body: _scopeClassBody(name),
    );
  }

  Node _fieldGetter(String name, String type) {
    final template = '''
// region field 

{{type}} _{{name}};

{{type}} get {{name}} => _{{name}};

set {{name}}({{type}} value) {
  assert(value != null, 'value is required');
  for (var i in eval()) {
    i._{{name}} = value;
  }
}

// endregion 
    ''';
    return Mustache.template(
      template,
      values: {
        'name': name,
        'type': type,
      },
    );
  }

  Node _isValidFunction() {
    final template = '''
@override
bool _isValid() => {{text}} 

    ''';

    return Mustache.template(
      template,
      values: {
        'text': isValidText,
      },
    );
  }

  Node _cloneFunction() {
    final template = '''
@override
ProtoLib clone() => super.clone()
{{text}};    
    ''';
    var fieldMap = Container(fields.keys
        .map((e) => Container([
              '\n.._',
              CodeFieldName.of(name: e),
              ' = _',
              CodeFieldName.of(name: e),
            ]))
        .toList());

    return Mustache.template(
      template,
      values: {
        'text': Indent(fieldMap, level: 2),
      },
    );
  }

  Node _fieldGetters() {
    return Container(
      fields?.entries?.map((e) => _fieldGetter(e.key, e.value))?.toList(),
    );
  }

  Node _scopeClassBody(String name) {
    final template = '''
\n    
{{scopes}}
ProtoLibScope({{constructorArgs}});

@override
{{className}} make() => {{className}}(this)
{{fieldMap}};  

{{className}} call(String name, { {{fieldList}} }) {
  return add(name)
{{addFields}};    
}
''';

    var scopes = CodeFieldList.of(fields.entries
        .map((e) => CodeField.of(name: e.key, type: e.value + ' scope'))
        .toList());

    var constructorArgs = Join.commaSeparated(fields.keys
        .map((e) => Container([
              'this.',
              CodeFieldName.of(name: e),
            ]))
        .toList());
    var fieldMap = Container(fields.keys
        .map((e) => Container([
              '\n.._',
              CodeFieldName.of(name: e),
              ' = _',
              CodeFieldName.of(name: e),
              '.none'
            ]))
        .toList());

    var addFields = Container(fields.keys
        .map((e) => Container([
              '\n.._',
              CodeFieldName.of(name: e),
              ' = _',
              CodeFieldName.of(name: e),
              '.none'
            ]))
        .toList());

    return Mustache.template(
      template,
      values: {
        'className': CodeClassName.of(name),
        'constructorArgs': constructorArgs,
        'scopes': scopes,
        'fieldMap': Indent(fieldMap, level: 2),
        'addFields': Indent(addFields, level: 3),
        // FIXME: This should be a array instead of map
        'fieldList': CodeArgList.of(required: fields),
      },
    );
  }
}

void main() async {
  var promptLoop = PromptLoop(
    'Continue?',
    init: true,
    onDone: (_) {
      // On finish,
      return Console.info('Thank you!!!');
    },
    onContinue: (_) {
      return Container([
        DotKeepFile(),
        // Prompts the target class name.
        PromptString(
          'name',
          message: 'name',
          child: Scope(
            fields: {
              'lib': 'ProtoLib',
              'fields': 'ProtoMessageField',
              'models': 'ProtoMessageModel',
            },
            isValidText: '_messages.isNonEmptyValidSet;',
          ),
        ),
      ]);
    },
  );

  final program = SingleChildNode(
    Directory.relative(
      '.out',
      Container([
        promptLoop,
      ]),
    ),
  );

  await Program.execute(program);
}
