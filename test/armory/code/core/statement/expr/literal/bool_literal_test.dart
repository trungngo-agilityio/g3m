import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../../../utils.dart';

void main() {
  test('null', () {
    var code = JavaCodeConfig(
      CodeBoolLiteral.of(null),
    );

    runAndExpect(
      code,
      'null',
    );
  });

  test('true', () {
    var code = JavaCodeConfig(
      CodeBoolLiteral.of(true),
    );

    runAndExpect(
      code,
      'true',
    );
  });

  test('false', () {
    var code = JavaCodeConfig(
      CodeBoolLiteral.of(false),
    );

    runAndExpect(
      code,
      'false',
    );
  });
}
