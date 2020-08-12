import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../../utils.dart';

void main() {
  test('no args', () async {
    var code = JavaCode(
      CodeFunctionCall.of('hello world'),
    );

    await runAndExpect(
      code,
      'helloWorld()',
    );
  });

  test('one arg', () async {
    var code = JavaCode(
      CodeFunctionCall.of('hello world', args: ['john doe']),
    );

    await runAndExpect(
      code,
      'helloWorld("john doe")',
    );
  });

  test('more than one', () async {
    var code = JavaCode(
      CodeFunctionCall.of('hello world', args: ['john doe', true, 1]),
    );

    await runAndExpect(
      code,
      'helloWorld("john doe", true, 1)',
    );
  });
}
