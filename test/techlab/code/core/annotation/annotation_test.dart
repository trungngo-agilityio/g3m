import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  void run(Node code, String expected) {
    runAndExpect(JavaCodeConfig(code), expected);
  }

  test('no args', () {
    final code = CodeAnnotation.of('required');
    run(code, '@required');
  });

  test('no args - required', () {
    final code = CodeAnnotation.required();
    run(code, '@required');
  });

  test('no args - override', () {
    final code = CodeAnnotation.override();
    run(code, '@override');
  });

  test('one arg', () {
    final code = CodeAnnotation.constructorCall(
        className: 'hello world', args: ['john doe']);

    run(
      code,
      '@HelloWorld("john doe")',
    );
  });

  test('more than one', () {
    final code = CodeAnnotation.constructorCall(
      className: 'hello world',
      args: [
        'john doe',
        true,
        1,
      ],
    );

    run(
      code,
      '@HelloWorld("john doe", true, 1)',
    );
  });
}
