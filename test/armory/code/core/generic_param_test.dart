import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('param', () {
    test('simple', () {
      var code = JavaCode(
        CodeGenericParam.of('my car'),
      );
      runAndExpect(code, 'MyCar');
    });
  });
}
