import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_dart.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () {
    var code = DartCodeConfig(
      CodeYield.of(Text('a')),
    );

    run(
      code,
      'yield a',
    );
  });

  test('async', () {
    var code = DartCodeConfig(
      CodeYield.of(Text('a'), async: true),
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
