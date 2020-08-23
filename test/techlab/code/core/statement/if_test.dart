import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () {
    var code = JavaCodeConfig(
      CodeIf.of(
        condition: true,
        then: CodeFunctionCall.of(name: 'hello'),
      ),
    );

    runAndExpect(
      code,
      'if (true) {\n'
      '  hello();\n'
      '}',
    );
  });

  test('with else', () {
    var code = JavaCodeConfig(
      CodeIf.of(
        condition: true,
        then: CodeReturn.of(true),
        orElse: CodeReturn.of(false),
      ),
    );

    runAndExpect(
      code,
      'if (true) {\n'
      '  return true;\n'
      '} else {\n'
      '  return false;\n'
      '}',
    );
  });

  test('with else if', () {
    var code = JavaCodeConfig(
      CodeIf.of(condition: true, then: [
        'print("do something");'
      ], elseIfs: [
        CodeElseIf.of(condition: false, then: CodeReturn.of('hello')),
        CodeElseIf.of(condition: false, then: CodeReturn.of('world')),
      ], orElse: [
        CodeFunctionCall.of(name: 'helloWorld'),
      ]),
    );

    runAndExpect(
      code,
      'if (true) {\n'
      '  print("do something");\n'
      '} else if (false) {\n'
      '  return "hello";\n'
      '} else if (false) {\n'
      '  return "world";\n'
      '} else {\n'
      '  helloWorld();\n'
      '}',
    );
  });
}
