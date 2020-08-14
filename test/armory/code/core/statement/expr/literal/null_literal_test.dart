import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../../../utils.dart';

void main() {
  test('null', () {
    var code = JavaCodeConfig(
      CodeNullLiteral(),
    );

    runAndExpect(
      code,
      'null',
    );
  });
}
