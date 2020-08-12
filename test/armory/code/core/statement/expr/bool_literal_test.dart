import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../../utils.dart';

void main() {
  test('null', () {
    var code = JavaCode(
      CodeBoolLiteral.of(null),
    );

    runAndExpect(
      code,
      'null',
    );
  });

  test('true', () {
    var code = JavaCode(
      CodeBoolLiteral.of(true),
    );

    runAndExpect(
      code,
      'true',
    );
  });

  test('false', () {
    var code = JavaCode(
      CodeBoolLiteral.of(false),
    );

    runAndExpect(
      code,
      'false',
    );
  });
}
