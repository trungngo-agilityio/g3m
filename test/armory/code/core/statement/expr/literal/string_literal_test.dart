import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../../../utils.dart';

void main() {
  test('null', () {
    var code = JavaCodeConfig(
      CodeStringLiteral.of(null),
    );

    runAndExpect(
      code,
      'null',
    );
  });

  test('has value', () {
    var code = JavaCodeConfig(
      CodeStringLiteral.of('a'),
    );

    runAndExpect(
      code,
      '"a"',
    );
  });
}
