import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../../../../utils.dart';

void main() {
  test('simple', () {
    var a = CodeRef.of('a');
    var t = CodeRef.ofThis();
    Node condition = CodeGreaterThanOrEqualExpr.of(
      a,
      t,
    );

    condition = CodeLogicalAndExpr.of(
      condition,
      CodeLessThanExpr.of(a, t),
    );

    var code = JavaCodeConfig(
      CodeIf.of(
        condition: condition,
        then: CodeFunctionCall.of(name: 'hello'),
      ),
    );

    runAndExpect(
      code,
      'if (a >= this && a < this) {\n'
      '    hello();\n'
      '}\n',
    );
  });
}
