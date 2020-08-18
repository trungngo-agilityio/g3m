import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_dart.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('all', () {
    var root = DartCode.of(
      body: Text.of('// You can put anything in this body.'),
      comment: CodeComment.of('Demo file level comment'),
      package: CodePackage.of('my personal vehicle'),
      imports: [
        CodeImport.of('io'),
        CodeImport.of('path', alias: 'ioPath'),
        CodeImport.of('math'),
      ],
      enums: [
        CodeEnum.of(
          name: 'color',
          values: [
            'blue',
            'dark green',
          ],
        ),
      ],
      functions: [
        CodeFunction.of(name: 'hello', isOverride: true, requiredArgs: [
          ['first name', 'string'],
        ], body: [
          'var name = "John";\n'
              'print(name)\n',
        ]),
      ],
      classes: [
        clazz(),
      ],
    );
    runAndExpect(
      root,
      '// Demo file level comment\n'
      'library my.personal.vehicle;\n'
      '\n'
      '\n'
      'import \'io\';\n'
      'import \'path\' as io.path;\n'
      'import \'math\';\n'
      '\n'
      '\n'
      'enum Color {\n'
      '  blue,\n'
      '  darkGreen\n'
      '}\n'
      '\n'
      '\n'
      'hello(String firstName) {\n'
      '  var name = "John";\n'
      '  print(name);;\n'
      '}\n'
      '\n'
      '\n'
      'abstract class Person<T> {\n'
      '  /// The human first name.\n'
      '  String firstName;\n'
      '\n'
      '\n'
      '  /// a demo constructor\n'
      '  Person(String name) {\n'
      '    // Any free text can be here\n'
      '  }\n'
      '\n'
      '\n'
      '  /// just a demo function\n'
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

CodeGenericParam genericParam() => CodeGenericParam.of(name: 'T');

CodeClass clazz() {
  return CodeClass.of(
    name: 'person',
    isPrivate: true,
    isAbstract: true,
    generic: [CodeGenericParam.of(name: 'T')],
    extend: null,
    implements: null,
    fields: [
      field(),
    ],
    constructors: [
      CodeConstructor.of(
          name: 'of',
          comment: 'a demo constructor',
          factory: true,
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
  return CodeFunction.of(name: 'drive',
      generic: ['T'],
      requiredArgs: [['vehicle', 'car']],
      isInternal: true,
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
    override: true,
    private: true,
    comment: 'The human first name.',
  );
}
