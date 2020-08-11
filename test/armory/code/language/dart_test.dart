import 'dart:io';

import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test('empty', () async {
    var root = Directory(
      '/tmp',
      Container([
        DartCodeFile.of(
          'hello2',
          body: Text('// You can put anything in this body.'),
          comment: CodeComment.of('Demo file level comment'),
          package: CodePackage.of('my personal vehicle'),
          imports: CodeImportList([
            CodeImport.of('io'),
            CodeImport.of('path', alias: 'ioPath'),
            CodeImport.of('math', types: [
              CodeImportType.of('vector'),
              CodeImportType.of('human matrix'),
            ]),
          ]),
          functions: CodeFunctionList([
            CodeFunction.of(
              'hello',
              args: {
                'first name': 'string',
              },
              body: Text('var name = "John";\n'
                  'print(name);\n'),
            ),
          ]),
          classes: CodeClassList([
            CodeClass.of(
              name: 'person',
              access: CodeAccess.publicAbstract(),
              generic: CodeGenericParamList.single('T'),
              extend: CodeClassExtendList.single('vehicle'),
              implements: CodeClassImplementList([
                CodeClassImplement.simple('wheel'),
                CodeClassImplement(
                  CodeDataType.genericSingle('fuel', 'T'),
                ),
              ]),
              fields: CodeFieldList([
                CodeField.of(
                    name: 'first name',
                    type: 'string',
                    comment: 'The human first name.'),
                CodeField.of(
                    name: 'last name',
                    type: 'string',
                    comment: 'The human last name.'),
              ]),
              constructors: CodeClassConstructorList([
                CodeClassConstructor.of(
                    comment: 'a demo constructor',
                    args: {'name': 'string'},
                    body: '// Any free text can be here'),
              ]),
              functions: CodeFunctionList([
                CodeFunction.of(
                  'drive',
                  generic: ['T'],
                  args: {'vehicle': 'car'},
                  comment: 'just a demo function',
                  returns: ['void'],
                  throws: ['accident exception', 'bad driver exception'],
                  body: Text('// Just any text'),
                ),
              ]),
              body: Mustache.of(
                '\n'
                '// just a free text class body \n'
                '// with Mustache template support.\n'
                'hello({{name}});',
                {'name': 'John Doe'},
              ),
            ),
          ]),
        ),
        File('abc.txt', Text('hello world')),
      ]),
    );
    await runAndExpect(root, '');
  });
}
