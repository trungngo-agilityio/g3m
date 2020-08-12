import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../../../utils.dart';

void main() {
  test('null', () {
    var code = JavaCode(
      CodeCharLiteral.of(null),
    );

    runAndExpect(
      code,
      'null',
    );
  });

  test('has value', () {
    var code = JavaCode(
      CodeCharLiteral.of('a'),
    );

    runAndExpect(
      code,
      '\'a\'',
    );
  });
}
