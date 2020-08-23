import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  void run(Node code, String expected) {
    runAndExpect(JavaCodeConfig(code), expected);
  }

  test('no args', () {
    final code = CodeAnnotation.of('hello world');

    run(
      code,
      '@HelloWorld()\n',
    );
  });

  test('one arg', () {
    final code = CodeAnnotation.of('hello world', args: ['john doe']);

    run(
      code,
      '@HelloWorld("john doe")\n',
    );
  });

  test('more than one', () {
    final code = CodeAnnotation.of(
      'hello world',
      args: [
        'john doe',
        true,
        1,
      ],
    );

    run(
      code,
      '@HelloWorld("john doe", true, 1)\n',
    );
  });
}
