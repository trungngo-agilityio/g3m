import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../../../../../utils.dart';

void main() {
  test('null', () {
    var code = JavaCodeConfig(
      CodeNumericLiteral.of(null),
    );

    runAndExpect(
      code,
      'null',
    );
  });

  test('from a string', () {
    var code = JavaCodeConfig(
      CodeNumericLiteral.of(1),
    );

    runAndExpect(
      code,
      '1',
    );
  });

  test('from a number', () {
    var code = JavaCodeConfig(
      CodeNumericLiteral.of(2),
    );

    runAndExpect(
      code,
      '2',
    );
  });
}
