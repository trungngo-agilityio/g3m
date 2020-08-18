import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', ()  {
    var code = JavaCodeConfig(
      CodeReturn.of(true),
    );

     runAndExpect(
      code,
      'return true',
    );
  });
}
