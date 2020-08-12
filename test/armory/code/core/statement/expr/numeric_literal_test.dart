import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../../utils.dart';

void main() {
  test('null', () {
    var code = JavaCode(
      CodeNumericLiteral.of(null),
    );

    runAndExpect(
      code,
      'null',
    );
  });

  test('from a string', () {
    var code = JavaCode(
      CodeNumericLiteral.of('1'),
    );

    runAndExpect(
      code,
      '1',
    );
  });

  test('from a number', () {
    var code = JavaCode(
      CodeNumericLiteral.of(2),
    );

    runAndExpect(
      code,
      '2',
    );
  });
}
