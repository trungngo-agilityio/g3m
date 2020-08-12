import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(Node child, String expected) async {
    var code = DartCode(CodeClass.of('person', body: child));
    await runAndExpect(code, expected);
  }

  test('hello', () async {
    await run(
      CodeClassConstructor.of(
        comment: 'Just a sample\n'
            'Another line.\n'
            'Another line.',
        access: CodeAccess.public(),
        body: 'var a = 1;',
      ),
      'abc',
    );
  });
}
