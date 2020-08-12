import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('null', () async {
    var code = JavaCode(
      CodeStatement.of(null),
    );

    await runAndExpect(
      code,
      '',
    );
  });

  test('one', () async {
    var code = JavaCode(
      CodeStatement.of('hello()'),
    );

    await runAndExpect(
      code,
      'hello();\n',
    );
  });

  test('list null', () async {
    var code = JavaCode(
      CodeStatementList.of(null),
    );

    await runAndExpect(
      code,
      '',
    );
  });

  test('list empty', () async {
    var code = JavaCode(
      CodeStatementList.of([]),
    );

    await runAndExpect(
      code,
      '',
    );
  });

  test('list one', () async {
    var code = JavaCode(
      CodeStatementList.of(['hello()']),
    );

    await runAndExpect(
      code,
      'hello();\n',
    );
  });

  test('list more than one', () async {
    var code = JavaCode(
      CodeStatementList.of(['hello()', ' ', 'hello2()']),
    );

    await runAndExpect(
      code,
      'hello();\n'
      '\n'
      'hello2();\n',
    );
  });
}
