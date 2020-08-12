import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('generic param', () {
    test('generic param', () {
      var code = DartCode(
        CodeGenericParam.of('hello world'),
      );
      runAndExpect(code, 'HelloWorld');
    });
  });
}
