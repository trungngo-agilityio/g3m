import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () {
    var code = JavaCodeConfig(
      CodeContinue(),
    );

    runAndExpect(
      code,
      'continue;\n',
    );
  });
}
