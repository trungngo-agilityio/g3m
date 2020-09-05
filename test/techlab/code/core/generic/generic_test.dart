import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
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
