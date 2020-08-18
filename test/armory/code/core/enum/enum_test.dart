import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  group('long syntax', () {
    test('empty', () {
      run(
        () => CodeEnum.of('person'),
        '\n'
        'enum Person {}\n',
      );
    });

    test('with code access', () {
      run(
        () => CodeEnum.of(
          'person',
          private: true,
        ),
        '\n'
        'private enum Person {}\n',
      );
    });

    test('with comment', () {
      run(
        () => CodeEnum.of(
          'person',
          comment: 'hello world',
        ),
        '\n'
        '/**\n'
        ' * hello world\n'
        ' */\n'
        'enum Person {}\n',
      );
    });

    test('with value', () {
      run(
        () => CodeEnum.of(
          'person',
          values: [
            CodeEnumValue.of('first name'),
          ],
        ),
        '\n'
        'enum Person {\n'
        '  FIRST_NAME\n'
        '}\n',
      );
    });

    test('with value list', () {
      run(
        () => CodeEnum.of(
          'person',
          values: [
            CodeEnumValue.of('first name'),
            CodeEnumValue.of('last name'),
          ],
        ),
        '\n'
        'enum Person {\n'
        '  FIRST_NAME,\n'
        '  LAST_NAME\n'
        '}\n',
      );
    });

    test('with all ', () {
      run(
        () {
          return CodeEnum.of(
            'person',
            private: true,
            values: [
              CodeEnumValue.of('first name'),
              CodeEnumValue.of('last name'),
            ],
          );
        },
        '\n'
        'private enum Person {\n'
        '  FIRST_NAME,\n'
        '  LAST_NAME\n'
        '}\n',
      );
    });
  });

  group('short syntax', () {
    test('with value', () {
      run(
        () => CodeEnum.of(
          'person',
          values: 'first name',
        ),
        '\n'
        'enum Person {\n'
        '  FIRST_NAME\n'
        '}\n',
      );
    });

    test('with all ', () {
      run(
        () {
          return CodeEnum.of(
            'person',
            private: true,
            values: [
              'first name',
              ['last name', 'john doe'],
              ['age', 10, 'this is a comment'],
            ],
          );
        },
        '\n'
        'private enum Person {\n'
        '  FIRST_NAME,\n'
        '  LAST_NAME = "john doe",\n'
        '  /**\n'
        '   * this is a comment\n'
        '   */\n'
        '  AGE = 10\n'
        '}\n',
      );
    });
  });
}

void run(Node Function() build, String expected) {
  var code = JavaCodeConfig(build());
  runAndExpect(code, expected);
}
