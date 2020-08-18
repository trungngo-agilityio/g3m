import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  group('generic param', () {
    test('generic param', () {
      var code = JavaCodeConfig(
        CodeGenericParam.of(name: 'hello world'),
      );
      runAndExpect(code, 'HelloWorld');
    });
  });
}
