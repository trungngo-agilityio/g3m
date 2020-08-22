import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_typescript.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('all', () {
    var root = TypescriptCode.of(
      body: Text.of('// You can put anything in this body.'),
      comment: CodeComment.of('Demo file level comment'),
      imports: [
        CodeImport.of(path: 'io'),
        CodeImport.of(path: 'path', alias: 'ioPath'),
        CodeImport.of(path: 'math', types: [
          CodeImportType.of(type: 'vector', alias: 'MyVector'),
          CodeImportType.of(type: 'human matrix'),
        ]),
      ],
      enums: [
        CodeEnum.of(
          name: 'color',
          values: ['blue', 'dark green'],
        ),
      ],
      functions: [
        CodeFunction.of(name: 'hello', requiredArgs: [
          ['first name', 'string'],
        ], body: [
          Text.of('var name = "John";\n'
              'print(name);\n'),
        ]),
      ],
      classes: [
        clazz(),
      ],
    );
    runAndExpect(
      root,
      '',
    );
  });
}

CodeInterface interfaze() {
  return CodeInterface.of(
    name: 'person',
    isPublic: true,
    isAbstract: true,
    generic: [
      genericParam(),
    ],
    extend: [
      CodeType.of(name: 'human'),
    ],
    fields: [
      field(),
    ],
    functions: [
      function(),
    ],
    body: Mustache.template(
      '\n'
      '// just a free text class body \n'
      '// with Mustache template support.\n'
      'hello({{name}});',
      values: {'name': 'John Doe'},
    ),
  );
}

CodeGenericParam genericParam() => CodeGenericParam.of(name: 'T');

CodeClass clazz() {
  return CodeClass.of(
    name: 'person',
    isPublic: true,
    isAbstract: true,
    generic: [CodeGenericParam.of(name: 'T')],
    extend: null,
    implements: null,
    fields: [
      field(),
    ],
    constructors: [
      CodeConstructor.of(
          comment: 'a demo constructor',
          requiredArgs: [['name', 'string']],
          body: Container(['// Any free text can be here'])),
    ],
    functions: [
      function(),
    ],
    body: Mustache.template(
      '\n'
      '// just a free text class body \n'
      '// with Mustache template support.\n'
      'hello({{name}});',
      values: {'name': 'John Doe'},
    ),
  );
}

CodeFunction function() {
  return CodeFunction.of(
      name: 'drive',
      generic: ['T'],
      requiredArgs: ['vehicle', 'car'],
      comment: 'just a demo function',
      returns: ['void'],
      throws: ['accident exception', 'bad driver exception'],
      body: [
        Text.of('// Just any text'),
      ]);
}

CodeField field() {
  return CodeField.of(
    name: 'first name',
    type: 'string',
    comment: 'The human first name.',
  );
}
