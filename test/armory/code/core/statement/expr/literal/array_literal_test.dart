import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../../../utils.dart';

void main() {
  test('null', () async {
    var code = JavaCode(
      CodeArrayLiteral.of(null),
    );

    await runAndExpect(
      code,
      'null',
    );
  });

  test('empty array', () async {
    var code = JavaCode(
      CodeArrayLiteral.of([]),
    );

    await runAndExpect(
      code,
      '[]',
    );
  });

  test('non empty array', () async {
    var code = JavaCode(
      CodeArrayLiteral.of([false, null, 'A']),
    );

    await runAndExpect(
      code,
      '[ false, null, "A" ]',
    );
  });
}
