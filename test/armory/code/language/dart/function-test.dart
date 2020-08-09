import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  group('no body', () {
    test('name only', () {
      var code = DartCode(
        CodeFunction.of(name: 'hello'),
      );
      runAndExpect(code, 'hello();\n');
    });

    test('with args', () {
      var code = DartCode(
        CodeFunction.of(
          name: 'hello',
          args: {
            'name': 'String',
            'another': 'Person',
          },
        ),
      );
      runAndExpect(code, 'hello(String name, Person another);\n');
    });

    test('with return', () {
      var code = DartCode(
        CodeFunction.of(
          name: 'hello',
          returns: ['string'],
        ),
      );
      runAndExpect(code, 'String hello();\n');
    });

    test('with generic', () {
      var code = DartCode(
        CodeFunction.of(
          name: 'hello',
          genericParams: ['T'],
          args: {
            'name': 'T',
          },
        ),
      );
      runAndExpect(code, 'hello<T>(T name);\n');
    });

    test('with throw', () {
      var code = DartCode(
        CodeFunction.of(
          name: 'hello',
          throws: ['invalid argument exception'],
        ),
      );
      runAndExpect(code, 'hello() throws InvalidArgumentException;\n');
    });

    test('with all', () {
      var code = DartCode(
        CodeFunction.of(
          name: 'hello',
          returns: ['string'],
          genericParams: ['t'],
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
      var code = DartCode(
        CodeFunction.of(
          name: 'hello',
          body: ['// some sample comment', 'callAFunction()'],
        ),
      );
      runAndExpect(code, 'hello();\n');
    });
  });
}
