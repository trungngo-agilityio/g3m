import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () async {
    var code = JavaCodeConfig(
      CodeIf.of(true, ['print("Hello World!")']),
    );

    await runAndExpect(
      code,
      'if (true) {\n'
      '  print("Hello World!");\n'
      '}',
    );
  });

  test('with else', () async {
    var code = JavaCodeConfig(
      CodeIf.of(true, ['print("do something")'],
          elseBlock: ['print("do something else")']),
    );

    await runAndExpect(
      code,
      'if (true) {\n'
      '  print("do something");\n'
      '} else {\n'
      '  print("do something else");\n'
      '}',
    );
  });

  test('with else if', () async {
    var code = JavaCodeConfig(
      CodeIf.of(true, [
        'print("do something");'
      ], elseIfBlocks: [
        CodeElseIf.of(false, ['print("do something")']),
        CodeElseIf.of(false, ['print("do something")']),
      ], elseBlock: [
        'print("do something else")'
      ]),
    );

    await runAndExpect(
      code,
      'if (true) {\n'
      '  print("do something");;\n'
      '} else if (false) {\n'
      '  print("do something");\n'
      '} else if (false) {\n'
      '  print("do something");\n'
      '} else {\n'
      '  print("do something else");\n'
      '}',
    );
  });
}
