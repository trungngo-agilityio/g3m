import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('null', () {
    var code = JavaCodeConfig(
      CodeStatement.of(null),
    );

    run(
      code,
      '',
    );
  });

  test('one', () {
    var code = JavaCodeConfig(
      CodeStatement.of('hello()'),
    );

    run(
      code,
      'hello()',
    );
  });

  test('list null', () {
    var code = JavaCodeConfig(
      CodeStatementList.of(null),
    );

    run(
      code,
      '',
    );
  });

  test('list empty', () {
    var code = JavaCodeConfig(
      CodeStatementList.of([]),
    );

    run(
      code,
      '',
    );
  });

  test('list one', () {
    var code = JavaCodeConfig(
      CodeStatementList.of(['hello()']),
    );

    run(
      code,
      'hello()',
    );
  });

  test('list more than one', () {
    var code = JavaCodeConfig(
      CodeStatementList.of([
        CodeReturn.of('a'),
        CodeBreak(),
        CodeContinue(),
      ]),
    );

    run(
      code,
      'return "a";\n'
      'break;\n'
      'continue;\n',
    );
  });
}

void run(Node code, String expected) {
  runAndExpect(JavaCodeConfig(code), expected);
}
