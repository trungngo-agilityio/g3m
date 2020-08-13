import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('no body', () {
    test('name only', () {
      var code = JavaCode(
        CodeFunction.of('hello'),
      );
      runAndExpect(code, 'hello();\n');
    });

    test('with args', () {
      var code = JavaCode(
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
      var code = JavaCode(
        CodeFunction.of(
          'hello',
          returns: ['string'],
        ),
      );
      runAndExpect(code, 'String hello();\n');
    });

    test('with generic', () {
      var code = JavaCode(
        CodeFunction.of(
          'hello',
          generic: ['T'],
          args: {
            'name': 'T',
          },
        ),
      );
      runAndExpect(code, 'hello<T>(T name);\n');
    });

    test('with throw', () {
      var code = JavaCode(
        CodeFunction.of(
          'hello',
          throws: ['invalid argument exception'],
        ),
      );
      runAndExpect(code, 'hello() throws InvalidArgumentException;\n');
    });

    test('with all', () {
      var code = JavaCode(
        CodeFunction.of(
          'hello',
          returns: ['string'],
          generic: ['t'],
          args: {
            'name': 'string',
            'another': 't',
          },
          throws: ['invalid argument exception'],
        ),
      );
      runAndExpect(code,
          'String hello<T>(String name, T another) throws InvalidArgumentException;\n');
    });
  });

  group('with body', () {
    test('name only', () {
      var code = JavaCode(
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
