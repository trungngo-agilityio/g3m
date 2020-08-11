import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(Node child, String expected) {
    var code = DartCode(child);
    runAndExpect(code, expected);
  }

  test('simple', () {
    run(
      CodeClassConstructor.of(
        comment: 'Just a sample',
        body: 'what',
      ),
      'abc',
    );
  });
}
