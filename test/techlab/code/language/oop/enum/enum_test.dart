import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_dart.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('long syntax', () {
    group('empty', () {
      oopRunAndExpect(
        CodeEnum.of(name: 'person'),
        java: '\n'
        'enum Person {}\n',
      );
    });

    group('with code access', () {
      oopRunAndExpect(
        CodeEnum.of(
          name: 'person',
          isPrivate: true,
        ),
        java: '\n'
        'private enum _Person {}\n',
      );
    });

    group('with comment', () {
      oopRunAndExpect(
        CodeEnum.of(
          name: 'person',
          comment: 'hello world',
        ),
        java: '\n'
        '/**\n'
        ' * hello world\n'
        ' */\n'
        'enum Person {}\n',
      );
    });

    group('with value', () {
      oopRunAndExpect(
        CodeEnum.of(
          name: 'person',
          values: [
            CodeEnumValue.of(name: 'first name'),
          ],
        ),
        java: '\n'
        'enum Person {\n'
        '  FIRST_NAME\n'
        '}\n',
      );
    });

    group('with value list', () {
      oopRunAndExpect(
        CodeEnum.of(
          name: 'person',
          values: [
            CodeEnumValue.of(name: 'first name'),
            CodeEnumValue.of(name: 'last name'),
          ],
        ),
        java: '\n'
        'enum Person {\n'
        '  FIRST_NAME,\n'
        '  LAST_NAME\n'
        '}\n',
      );
    });

    group('with all ', () {
      oopRunAndExpect(
        CodeEnum.of(
          name: 'person',
          isPrivate: true,
          values: [
            CodeEnumValue.of(name: 'first name'),
            CodeEnumValue.of(name: 'last name'),
          ],
        ),
        java: '\n'
        'private enum _Person {\n'
        '  FIRST_NAME,\n'
        '  LAST_NAME\n'
        '}\n',
      );
    });
  });

  group('short syntax', () {
    group('with value', () {
      oopRunAndExpect(
        CodeEnum.of(
          name: 'person',
          values: 'first name',
        ),
        java: '\n'
        'enum Person {\n'
        '  FIRST_NAME\n'
        '}\n',
      );
    });

    group('with all ', () {
      oopRunAndExpect(
        CodeEnum.of(
          name: 'person',
          isPrivate: true,
          values: [
            'first name',
            ['last name', 'john doe'],
            ['age', 10, 'this is a comment'],
          ],
        ),
        java: '\n'
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

  group('with dart private', () {
    oopRunAndExpect(
      DartCodeConfig(
        CodeEnum.of(
          name: 'hello',
          isPrivate: true,
          values: [
            'first name',
          ],
        ),
      ),
      java: '\n'
      'enum _Hello {\n'
      '  firstName\n'
      '}\n'
      '',
    );
  });
}

