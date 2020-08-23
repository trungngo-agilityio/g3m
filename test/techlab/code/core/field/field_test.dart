import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () {
    var code = JavaCodeConfig(
      CodeField.of(
        name: 'first name',
        type: 'string',
      ),
    );
    runAndExpect(
      code,
      '\n'
      'String firstName',
    );
  });

  test('with statement', () {
    var code = JavaCodeConfig(
      CodeStatement.of(
        CodeField.of(
          name: 'first name',
          type: 'string',
        ),
      ),
    );
    runAndExpect(
      code,
      '\n'
      'String firstName;\n',
    );
  });

  test('with init', () {
    var code = JavaCodeConfig(
      CodeField.of(
        name: 'first name',
        type: 'string',
        init: CodeStringLiteral.of('john'),
      ),
    );
    runAndExpect(
      code,
      '\n'
      'String firstName = "john"',
    );
  });

  test('with init', () {
    var code = JavaCodeConfig(
      CodeField.of(
        name: 'first name',
        type: 'string',
        isPrivate: true,
        isStatic: true,
      ),
    );
    runAndExpect(
      code,
      '\n'
      'private static String firstName',
    );
  });

  test('with comment', () {
    var code = JavaCodeConfig(
      CodeField.of(
        name: 'first name',
        type: 'string',
        comment: 'hello world',
      ),
    );
    runAndExpect(
      code,
      '\n'
      '// hello world\n'
      'String firstName',
    );
  });
}
