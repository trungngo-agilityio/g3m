import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(Node node, String expected) {
    var code = JavaCode(node);
    runAndExpect(code, expected);
  }

  test('null', () {
    run(
      CodeGroupExpr.of(null),
      '',
    );
  });

  test('empty', () {
    run(
      CodeGroupExpr.of([]),
      '',
    );
  });

  test('1 expr', () {
    run(
      CodeGroupExpr.of([
        CodeEqualExpr.of('a', 'b'),
      ]),
      '("a" == "b")',
    );
  });

  test('2 expr', () {
    run(
      CodeGroupExpr.of([
        CodeLogicalAndExpr.of(
          CodeEqualExpr.of('a', 'b'),
          CodeNotEqualExpr.of('a', 'b'),
        ),
        CodeNullLiteral(),
      ]),
      '("a" == "b" && "a" != "b", null)',
    );
  });
}
