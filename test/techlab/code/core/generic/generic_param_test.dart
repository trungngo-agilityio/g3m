import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  group('param', () {
    test('simple', () {
      var code = JavaCodeConfig(
        CodeGenericParam.of(name: 'my car'),
      );
      runAndExpect(code, 'MyCar');
    });
  });
}
