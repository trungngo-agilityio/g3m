import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_java.dart';
import 'package:test/test.dart';

import '../../../../utils.dart';

void main() {
  test('no args', () {
    var code = JavaCodeConfig(
      CodeFunctionCall.of(name: 'hello world'),
    );

    runAndExpect(
      code,
      'helloWorld()',
    );
  });

  test('one arg', () {
    var code = JavaCodeConfig(
      CodeFunctionCall.of(name: 'hello world', args: ['john doe']),
    );

    runAndExpect(
      code,
      'helloWorld("john doe")',
    );
  });

  test('more than one', () {
    var code = JavaCodeConfig(
      CodeFunctionCall.of(name: 'hello world', args: ['john doe', true, 1]),
    );

    runAndExpect(
      code,
      'helloWorld("john doe", true, 1)',
    );
  });
}
