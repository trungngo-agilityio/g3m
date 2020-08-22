import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_dart.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  group('long syntax', () {
    test('empty', () {
      run(
        CodeEnum.of(name: 'person'),
        '\n'
        'enum Person {}\n',
      );
    });

    test('with code access', () {
      run(
        CodeEnum.of(
          name: 'person',
          isPrivate: true,
        ),
        '\n'
        'private enum _Person {}\n',
      );
    });

    test('with comment', () {
      run(
        CodeEnum.of(
          name: 'person',
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
        CodeEnum.of(
          name: 'person',
          values: [
            CodeEnumValue.of(name: 'first name'),
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
        CodeEnum.of(
          name: 'person',
          values: [
            CodeEnumValue.of(name: 'first name'),
            CodeEnumValue.of(name: 'last name'),
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
        CodeEnum.of(
          name: 'person',
          isPrivate: true,
          values: [
            CodeEnumValue.of(name: 'first name'),
            CodeEnumValue.of(name: 'last name'),
          ],
        ),
        '\n'
        'private enum _Person {\n'
        '  FIRST_NAME,\n'
        '  LAST_NAME\n'
        '}\n',
      );
    });
  });

  group('short syntax', () {
    test('with value', () {
      run(
        CodeEnum.of(
          name: 'person',
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
        CodeEnum.of(
          name: 'person',
          isPrivate: true,
          values: [
            'first name',
            ['last name', 'john doe'],
            ['age', 10, 'this is a comment'],
          ],
        ),
        '\n'
        'private enum _Person {\n'
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

  test('with dart private', () {
    run(
      DartCodeConfig(
        CodeEnum.of(
          name: 'hello',
          isPrivate: true,
          values: [
            'first name',
          ],
        ),
      ),
      '\n'
      'enum _Hello {\n'
      '  firstName\n'
      '}\n'
      '',
    );
  });
}

void run(Node code, String expected) {
  runAndExpect(JavaCodeConfig(code), expected);
}
