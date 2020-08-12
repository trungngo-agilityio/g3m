import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () async {
    var code = JavaCode(
      CodeReturn.of(true),
    );

    await runAndExpect(
      code,
      'return true;\n',
    );
  });
}
