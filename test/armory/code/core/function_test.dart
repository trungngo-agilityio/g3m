import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('no body', () {
    test('name only', () {
      var code = JavaCodeConfig(
        CodeFunction.of('hello'),
      );
      runAndExpect(code, 'hello();\n');
    });

    test('with args', () {
      var code = JavaCodeConfig(
        CodeFunction.of(
          'hello',
          args: {
            'name': 'String',
            'another': 'Person',
          },
        ),
      );
      runAndExpect(code, 'hello(String name, Person another);\n');
    });

    test('with return', () {
      var code = JavaCodeConfig(
        CodeFunction.of(
          'hello',
          returns: ['string'],
        ),
      );
      runAndExpect(code, 'String hello();\n');
    });

    test('with annotation', () async {
      var code = JavaCodeConfig(
        CodeFunction.of(
          'hello',
          annotations: [
            CodeAnnotation.of('repository'),
            CodeAnnotation.of('repository', args: [1, false]),
          ],
        ),
      );
      await runAndExpect(
        code,
        '@Repository()\n'
        '@Repository(1, false)\n'
        'hello();\n',
      );
    });

    test('with access', () async {
      var code = JavaCodeConfig(
        CodeFunction.of(
          'hello',
          override: true,
          private: true,
          static: true,
        ),
      );
      await runAndExpect(
        code,
        '@override\n'
        'private static hello();\n',
      );
    });

    test('with generic', () async {
      var code = JavaCodeConfig(
        CodeFunction.of(
          'hello',
          generic: ['T'],
          args: {
            'name': 'T',
          },
        ),
      );
      await runAndExpect(
        code,
        'hello<T>(T name);\n',
      );
    });

    test('with throw', () {
      var code = JavaCodeConfig(
        CodeFunction.of(
          'hello',
          throws: ['invalid argument exception'],
        ),
      );
      runAndExpect(code, 'hello() throws InvalidArgumentException;\n');
    });

    test('with all', () async {
      var code = JavaCodeConfig(
        CodeFunction.of(
          'hello',
          returns: ['string'],
          annotations: [
            CodeAnnotation.of('repository'),
            CodeAnnotation.of('repository', args: [1, false]),
          ],
          generic: ['t'],
          args: {
            'name': 'string',
            'another': 't',
          },
          throws: ['invalid argument exception'],
        ),
      );
      await runAndExpect(
        code,
        '@Repository()\n'
        '@Repository(1, false)\n'
        'String hello<T>(String name, T another) throws InvalidArgumentException;\n',
      );
    });
  });

  group('with body', () {
    test('name only', () {
      var code = JavaCodeConfig(
        CodeFunction.of(
          'hello',
          body: ['// some sample comment', 'callAFunction()'],
        ),
      );
      runAndExpect(
        code,
        'hello() {\n'
        '  // some sample comment;\n'
        '  callAFunction();\n'
        '  \n'
        '}\n',
      );
    });
  });
}
