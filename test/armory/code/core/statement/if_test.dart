import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () async {
    var code = JavaCode(
      CodeIf.of(true, 'print("Hello World!");'),
    );

    await runAndExpect(
      code,
      'continue;\n',
    );
  });

  test('with else', () async {
    var code = JavaCode(
      CodeIf.of(true, 'print("do something");',
          elseBlock: 'print("do something else");'),
    );

    await runAndExpect(
      code,
      'continue;\n',
    );
  });

  test('with else if', () async {
    var code = JavaCode(
      CodeIf.of(true, 'print("do something");',
          elseIfBlocks: [
            CodeElseIf.of(false, 'print("do something");'),
            CodeElseIf.of(false, 'print("do something");'),
          ],
          elseBlock: 'print("do something else");'),
    );

    await runAndExpect(
      code,
      'continue;\n',
    );
  });
}
