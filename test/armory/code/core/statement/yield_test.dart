import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_dart.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () async {
    var code = DartCodeConfig(
      CodeYield.of(Text.of('a')),
    );

    await runAndExpect(
      code,
      'yield a',
    );
  });

  test('async', () async {
    var code = DartCodeConfig(
      CodeYield.of(Text.of('a'), async: true),
    );

    await runAndExpect(
      code,
      'yield* a',
    );
  });
}
