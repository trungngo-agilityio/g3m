import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_dart.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('all', () {
    var root = DartCode.of(
      body: Text.of('// You can put anything in this body.'),
      comment: CodeComment.of('Demo file level comment'),
      package: CodePackage.of('my personal vehicle'),
      imports: [
        CodeImport.of(package: 'io'),
        CodeImport.of(package: 'path', alias: 'ioPath'),
        CodeImport.of(package: 'math'),
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
      'library my_personal_vehicle;\n'
      '\n'
      '\n'
      'import;\n'
      'import  as io_path;\n'
      'import;\n'
      '\n'
      '\n'
      'enum Color {\n'
      '  blue,\n'
      '  darkGreen\n'
      '}\n'
      '\n'
      '\n'
      '@override\n'
      'hello(String firstName) {\n'
      '  var name = "John";\n'
      '  print(name)\n'
      '}\n'
      '\n'
      '\n'
      'abstract class _Person<T> {\n'
      '  /// The human first name.\n'
      '  @override\n'
      '  String _firstName;\n'
      '\n'
      '\n'
      '  /// a demo constructor\n'
      '  factory _Person.of(this.mapEntry(name:String)) {\n'
      '    // Any free text can be here\n'
      '  }\n'
      '\n'
      '\n'
      '  /// just a demo function\n'
      '  void _drive<T>(Car vehicle) {\n'
      '    // Just any text\n'
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
  return CodeFunction.of(
      name: 'drive',
      generic: ['T'],
      requiredArgs: [
        ['vehicle', 'car']
      ],
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
    isOverride: true,
    isPrivate: true,
    comment: 'The human first name.',
  );
}
