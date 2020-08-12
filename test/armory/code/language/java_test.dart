import 'dart:io';

import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test('all', () async {
    var root = Directory(
      '/tmp',
      Container([
        JavaCodeFile.of(
          'demo1',
          body: Text('// You can put anything in this body.'),
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
          functions: [
            CodeFunction.of(
              'hello',
              args: {
                'first name': 'string',
              },
              body: Text('var name = "John";\n'
                  'print(name);\n'),
            ),
          ],
          interfaces: [
            interfaze(),
          ],
          classes: [
            clazz(),
          ],
        ),
        File('abc.txt', Text('hello world')),
      ]),
    );
    await runAndExpect(root, '');
  });
}

CodeInterface interfaze() {
  return CodeInterface.of(
    'person',
    access: CodeAccess.publicAbstract(),
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
    access: CodeAccess.publicAbstract(),
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
          body: '// Any free text can be here'),
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
  return CodeFunction.of(
    'drive',
    generic: ['T'],
    args: {'vehicle': 'car'},
    comment: 'just a demo function',
    returns: ['void'],
    throws: ['accident exception', 'bad driver exception'],
    body: Text('// Just any text'),
  );
}

CodeField field() {
  return CodeField.of(
    name: 'first name',
    type: 'string',
    comment: 'The human first name.',
  );
}
