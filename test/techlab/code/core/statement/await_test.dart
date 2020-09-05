import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
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
