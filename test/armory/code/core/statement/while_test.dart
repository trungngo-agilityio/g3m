import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () async {
    var code = JavaCodeConfig(
      CodeWhile.of(true, ['print("Hello World!")']),
    );

    await runAndExpect(
        code,
        'while (true) {\n'
        '  print("Hello World!");\n'
        '}\n');
  });
}
