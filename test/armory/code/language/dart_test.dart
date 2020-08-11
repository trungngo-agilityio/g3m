import 'dart:io';

import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test('empty', () async {
    var root = Directory.temp(
      '~step1',
      Container([
        DartCodeFile.of('hello2',
            body: Text('just any body'),
            comment: CodeComment.of('simple comment'),
            functions: CodeFunctionList([
              CodeFunction.simple(
                'hello',
                args: {
                  'first name': 'string',
                },
              ),
            ])),
        File('abc.txt', Text('hello world')),
      ]),
    );
    await runAndExpect(root, '');
  });
}
