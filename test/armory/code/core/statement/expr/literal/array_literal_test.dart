import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../../../utils.dart';

void main() {
  test('null', () {
    var code = JavaCodeConfig(
      CodeArrayLiteral.of(null),
    );

    runAndExpect(
      code,
      'null',
    );
  });

  test('empty array', () {
    var code = JavaCodeConfig(
      CodeArrayLiteral.of([]),
    );

    runAndExpect(
      code,
      '[]',
    );
  });

  test('non empty array', () {
    var code = JavaCodeConfig(
      CodeArrayLiteral.of([false, null, 'A']),
    );

    runAndExpect(
      code,
      '[\n'
      '  false,\n'
      '  null,\n'
      '  "A"\n'
      ']',
    );
  });
}
