import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('all', () async {
    var root = JavaCode.of(
      body: Text.of('// You can put anything in this body.'),
      comment: CodeComment.of('Demo file level comment'),
      package: CodePackage.of('my personal vehicle'),
      imports: [
        CodeImport.of('io'),
        CodeImport.of('path', alias: 'ioPath'),
        CodeImport.of('math', types: [
          CodeImportType.of('vector'),
          CodeImportType.of('human matrix'),
        ]),
      ],
      enums: [
        CodeEnum.of(
          'color',
          values: [
            CodeEnumValue.of('blue'),
            CodeEnumValue.of('dark green'),
          ],
        ),
      ],
      functions: [
        CodeFunction.of('hello', args: {
          'first name': 'string',
        }, body: [
          Text.of('var name = "John";\n'
              'print(name);\n'),
        ]),
      ],
      interfaces: [
        interfaze(),
      ],
      classes: [
        clazz(),
      ],
    );
    await runAndExpect(
      root,
      '// Demo file level comment\n'
      'package my.personal.vehicle;\n'
      '\n'
      '\n'
      'import io.*;\n'
      'import path.*;\n'
      'import math.Vector;\n'
      'import math.HumanMatrix;\n'
      '\n'
      '\n'
      'enum Color {\n'
      '  BLUE,\n'
      '  DARK_GREEN\n'
      '}\n'
      '\n'
      '\n'
      'hello(String firstName) {\n'
      '  var name = "John";\n'
      '  print(name);;\n'
      '}\n'
      '\n'
      '\n'
      'public abstract interface Person<T> extends Human {\n'
      '  // The human first name.\n'
      '  String firstName;\n'
      '\n'
      '\n'
      '  /**\n'
      '   * just a demo function\n'
      '   */\n'
      '  void drive<T>(Car vehicle) throws AccidentException, BadDriverException {\n'
      '    // Just any text;\n'
      '  }\n'
      '  // just a free text class body \n'
      '  // with Mustache template support.\n'
      '  hello(John Doe);\n'
      '}\n'
      '\n'
      '\n'
      '\n'
      'public abstract class Person<T> {\n'
      '  // The human first name.\n'
      '  String firstName;\n'
      '\n'
      '\n'
      '  /**\n'
      '   * a demo constructor\n'
      '   */\n'
      '  Person(String name) {\n'
      '    // Any free text can be here\n'
      '  }\n'
      '\n'
      '\n'
      '  /**\n'
      '   * just a demo function\n'
      '   */\n'
      '  void drive<T>(Car vehicle) throws AccidentException, BadDriverException {\n'
      '    // Just any text;\n'
      '  }\n'
      '  // just a free text class body \n'
      '  // with Mustache template support.\n'
      '  hello(John Doe);\n'
      '}\n'
      '// You can put anything in this body.',
    );
  });
}

CodeInterface interfaze() {
  return CodeInterface.of(
    'person',
    public: true,
    abstract: true,
    generic: [
      genericParam(),
    ],
    extend: [
      CodeType.simple('human'),
    ],
    fields: [
      field(),
    ],
    functions: [
      function(),
    ],
    body: Mustache.of(
      '\n'
      '// just a free text class body \n'
      '// with Mustache template support.\n'
      'hello({{name}});',
      {'name': 'John Doe'},
    ),
  );
}

CodeGenericParam genericParam() => CodeGenericParam.of('T');

CodeClass clazz() {
  return CodeClass.of(
    'person',
    public: true,
    abstract: true,
    generic: [CodeGenericParam.of('T')],
    extend: null,
    implements: null,
    fields: [
      field(),
    ],
    constructors: [
      CodeClassConstructor.of(
          comment: 'a demo constructor',
          args: {'name': 'string'},
          body: Container(['// Any free text can be here'])),
    ],
    functions: [
      function(),
    ],
    body: Mustache.of(
      '\n'
      '// just a free text class body \n'
      '// with Mustache template support.\n'
      'hello({{name}});',
      {'name': 'John Doe'},
    ),
  );
}

CodeFunction function() {
  return CodeFunction.of('drive',
      generic: ['T'],
      args: {'vehicle': 'car'},
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
