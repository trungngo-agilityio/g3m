import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () {
    var code = JavaCodeConfig(
      CodeIf.of(true, ['print("Hello World!")']),
    );

    runAndExpect(
      code,
      'if (true) {\n'
      '  print("Hello World!");\n'
      '}',
    );
  });

  test('with else', () {
    var code = JavaCodeConfig(
      CodeIf.of(true, ['print("do something")'],
          elseBlock: ['print("do something else")']),
    );

    runAndExpect(
      code,
      'if (true) {\n'
      '  print("do something");\n'
      '} else {\n'
      '  print("do something else");\n'
      '}',
    );
  });

  test('with else if', () {
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

    runAndExpect(
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
