import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () {
    var code = JavaCode(
      CodeBreak(),
    );

    runAndExpect(
      code,
      'break;\n',
    );
  });
}
