import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
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
