import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('comment', () {
    void run(Node Function() build, String expected) async {
      var code = JavaCodeConfig(build());
      await runAndExpect(code, expected);
    }

    test('empty', () async {
      await run(
        () => CodeEnum.of('person'),
        '\n'
        'enum Person {\n'
        '\n'
        '}\n',
      );
    });

    test('with code access', () async {
      await run(
        () => CodeEnum.of(
          'person',
          private: true,
        ),
        '\n'
        'private enum Person {\n'
        '\n'
        '}\n',
      );
    });

    test('with comment', () async {
      await run(
        () => CodeEnum.of(
          'person',
          comment: 'hello world',
        ),
        '\n'
        '/**\n'
        ' * hello world\n'
        ' */\n'
        'enum Person {\n'
        '\n'
        '}\n',
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

    test('with value list', () async {
      await run(
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

    test('with all ', () async {
      await run(
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
}
