import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_java.dart';
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
