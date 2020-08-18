import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('all', () {
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
      interfaces: [
        interfaze(),
      ],
      classes: [
        clazz(),
      ],
    );
    runAndExpect(
      root,
      '// Demo file level comment\n'
      'package myPersonalVehicle;\n'
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
    'person',
    public: true,
    abstract: true,
    generic: [CodeGenericParam.of(name: 'T')],
    extend: null,
    implements: null,
    fields: [
      field(),
    ],
    constructors: [
      CodeConstructor.of(
          comment: 'a demo constructor',
          requiredArgs: {'name': 'string'},
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
