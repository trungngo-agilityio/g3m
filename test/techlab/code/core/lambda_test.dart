import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test('empty', () {
    var code = JavaCodeConfig(
      CodeLambda.of(),
    );
    runAndExpect(
      code,
      '() {}',
    );
  });
  test('with all', () {
    var code = JavaCodeConfig(
      CodeLambda.of(requiredArgs: [
        ['_'],
        ['first name'],
        ['last name', 'string'],
        CodeArg.of(name: 'text', type: 'string', isFinal: true)
      ], body: [
        CodeFunctionCall.of(
            name: 'callALambda',
            args: CodeLambda.of(
              requiredArgs: '_',
              body: CodeReturn.of(false),
            )),
        CodeReturn.of(true),
      ]),
    );
    runAndExpect(
      code,
      '(_, firstName, String lastName, final String text) {\n'
      '    callALambda((_) {\n'
      '        return false;\n'
      '    });\n'
      '    return true;\n'
      '}',
    );
  });
}
