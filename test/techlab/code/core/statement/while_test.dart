import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () {
    var code = JavaCodeConfig(
      CodeWhile.of(condition: true, body: ['print("Hello World!");']),
    );

    runAndExpect(
        code,
        'while (true) {\n'
        '  print("Hello World!");\n'
        '}\n');
  });
}
