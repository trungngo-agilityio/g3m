import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
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
      '  hello();\n'
      '}',
    );
  });
}
