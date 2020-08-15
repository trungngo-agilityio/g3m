import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test('no args', () async {
    var code = JavaCodeConfig(
      CodeAnnotation.of('hello world'),
    );

    await runAndExpect(
      code,
      '@HelloWorld()\n',
    );
  });

  test('one arg', () async {
    var code = JavaCodeConfig(
      CodeAnnotation.of('hello world', args: ['john doe']),
    );

    await runAndExpect(
      code,
      '@HelloWorld("john doe")\n',
    );
  });

  test('more than one', () async {
    var code = JavaCodeConfig(
      CodeAnnotation.of('hello world', args: ['john doe', true, 1]),
    );

    await runAndExpect(
      code,
      '@HelloWorld("john doe", true, 1)\n',
    );
  });
}
