import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test('simple', () {
    var code = JavaCode(
      CodeField.of(
        name: 'first name',
        type: 'string',
      ),
    );
    runAndExpect(
      code,
      '\n'
      'String firstName;\n',
    );
  });

  test('with init', () {
    var code = JavaCode(
      CodeField.of(
        name: 'first name',
        type: 'string',
        init: CodeStringLiteral.of('john'),
      ),
    );
    runAndExpect(
      code,
      '\n'
      'String firstName = "john";\n',
    );
  });

  test('with comment', () {
    var code = DartCode(
      CodeField.of(
        name: 'first name',
        type: 'string',
        comment: 'hello world',
      ),
    );
    runAndExpect(
      code,
      '/// hello world\n'
      'String firstName;\n',
    );
  });
}
