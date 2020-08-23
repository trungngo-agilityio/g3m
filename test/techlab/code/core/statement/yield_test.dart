import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_dart.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () {
    var code = DartCodeConfig(
      CodeYield.of(Text.of('a')),
    );

    run(
      code,
      'yield a',
    );
  });

  test('async', () {
    var code = DartCodeConfig(
      CodeYield.of(Text.of('a'), async: true),
    );

    run(
      code,
      'yield* a',
    );
  });
}

void run(Node code, String expected) {
  runAndExpect(
    DartCodeConfig(code),
    expected,
  );
}
