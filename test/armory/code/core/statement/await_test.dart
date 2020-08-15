import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () async {
    var code = JavaCodeConfig(
      CodeAwait.of(Text.of('a')),
    );

    await runAndExpect(
      code,
      'await a',
    );
  });
}
