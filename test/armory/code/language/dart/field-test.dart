import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () {
    var code = DartCode(
      CodeField.of(name: 'first name', type: 'string'),
    );
    runAndExpect(code, 'String firstName;\n');
  });
}
