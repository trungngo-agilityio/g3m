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
          body: Text('just any body'),
          comment: CodeComment.of('simple comment'),
          package: CodePackage.of('my personal'),
          imports: CodeImportList([
            CodeImport.of('io'),
            CodeImport.of('math', types: [
              CodeImportType.of('vector'),
              CodeImportType.of('human matrix'),
            ]),
          ]),
          functions: CodeFunctionList([
            CodeFunction.simple(
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
            ),
          ]),
        ),
        File('abc.txt', Text('hello world')),
      ]),
    );
    await runAndExpect(root, '');
  });
}
