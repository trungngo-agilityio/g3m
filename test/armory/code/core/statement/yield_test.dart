import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () async {
    var code = JavaCodeConfig(
      CodeYield.of(Text.of('a')),
    );

    await runAndExpect(
      code,
      'yield a',
    );
  });
}
