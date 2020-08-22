import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(Node node, String expected) {
    var code = JavaCode(node);
    runAndExpect(code, expected);
  }

  test('CodeEqualExpr', () {
    run(
      CodeEqualExpr.of('a', 'b'),
      '"a" == "b"',
    );
  });
  test('CodeNotEqualExpr', () {
    run(
      CodeNotEqualExpr.of('a', 'b'),
      '"a" != "b"',
    );
  });
  test('CodeGreaterThanExpr', () {
    run(
      CodeGreaterThanExpr.of('a', 'b'),
      '"a" > "b"',
    );
  });
  test('CodeGreaterThanOrEqualExpr', () {
    run(
      CodeGreaterThanOrEqualExpr.of('a', 'b'),
      '"a" >= "b"',
    );
  });
  test('CodeLessThanExpr', () {
    run(
      CodeLessThanExpr.of('a', 'b'),
      '"a" < "b"',
    );
  });
  test('CodeLessThanOrEqualExpr', () {
    run(
      CodeLessThanOrEqualExpr.of('a', 'b'),
      '"a" <= "b"',
    );
  });
  test('CodeAsExpr', () {
    run(
      CodeAsExpr.of('a', 'b'),
      '"a" as "b"',
    );
  });
  test('CodeIsExpr', () {
    run(
      CodeIsExpr.of('a', 'b'),
      '"a" is "b"',
    );
  });
  test('CodeIsNotExpr', () {
    run(
      CodeIsNotExpr.of('a', 'b'),
      '"a" is! "b"',
    );
  });
  test('CodePlusExpr', () {
    run(
      CodePlusExpr.of('a', 'b'),
      '"a" + "b"',
    );
  });
  test('CodeMinusExpr', () {
    run(
      CodeMinusExpr.of('a', 'b'),
      '"a" - "b"',
    );
  });
  test('CodeMultiplyExpr', () {
    run(
      CodeMultiplyExpr.of('a', 'b'),
      '"a" * "b"',
    );
  });
  test('CodeDivideExpr', () {
    run(
      CodeDivideExpr.of('a', 'b'),
      '"a" / "b"',
    );
  });
  test('CodeDivExpr', () {
    run(
      CodeDivExpr.of('a', 'b'),
      '"a" ~/ "b"',
    );
  });
  test('CodeModExpr', () {
    run(
      CodeModExpr.of('a', 'b'),
      '"a" % "b"',
    );
  });
  test('CodeBitShiftLeftExpr', () {
    run(
      CodeBitShiftLeftExpr.of('a', 'b'),
      '"a" << "b"',
    );
  });
  test('CodeBitShiftRightExpr', () {
    run(
      CodeBitShiftRightExpr.of('a', 'b'),
      '"a" >> "b"',
    );
  });
  test('CodeBitAndExpr', () {
    run(
      CodeBitAndExpr.of('a', 'b'),
      '"a" & "b"',
    );
  });
  test('CodeBitOrExpr', () {
    run(
      CodeBitOrExpr.of('a', 'b'),
      '"a" | "b"',
    );
  });
  test('CodeBitXorExpr', () {
    run(
      CodeBitXorExpr.of('a', 'b'),
      '"a" ^ "b"',
    );
  });
  test('CodeBitNegateExpr', () {
    run(
      CodeBitNegateExpr.of('a'),
      '~"a"',
    );
  });
  test('CodeAssignExpr', () {
    run(
      CodeAssignExpr.of('a', 'b'),
      '"a" = "b"',
    );
  });
  test('CodeAssignIfNullExpr', () {
    run(
      CodeAssignIfNullExpr.of('a', 'b'),
      '"a" ??= "b"',
    );
  });
  test('CodePlusAssignExpr', () {
    run(
      CodePlusAssignExpr.of('a', 'b'),
      '"a" += "b"',
    );
  });
  test('CodeMinusAssignExpr', () {
    run(
      CodeMinusAssignExpr.of('a', 'b'),
      '"a" -= "b"',
    );
  });
  test('CodeMultiplyAssignExpr', () {
    run(
      CodeMultiplyAssignExpr.of('a', 'b'),
      '"a" *= "b"',
    );
  });
  test('CodeDivideAssignExpr', () {
    run(
      CodeDivideAssignExpr.of('a', 'b'),
      '"a" /= "b"',
    );
  });
  test('CodeModAssignExpr', () {
    run(
      CodeModAssignExpr.of('a', 'b'),
      '"a" %= "b"',
    );
  });
  test('CodeBitShiftLeftAssignExpr', () {
    run(
      CodeBitShiftLeftAssignExpr.of('a', 'b'),
      '"a" <<= "b"',
    );
  });
  test('CodeBitShiftRightAssignExpr', () {
    run(
      CodeBitShiftRightAssignExpr.of('a', 'b'),
      '"a" >>= "b"',
    );
  });
  test('CodeBitAndAssignExpr', () {
    run(
      CodeBitAndAssignExpr.of('a', 'b'),
      '"a" &= "b"',
    );
  });
  test('CodeBitOrAssignExpr', () {
    run(
      CodeBitOrAssignExpr.of('a', 'b'),
      '"a" |= "b"',
    );
  });
  test('CodeBitXorAssignExpr', () {
    run(
      CodeBitXorAssignExpr.of('a', 'b'),
      '"a" ^= "b"',
    );
  });
  test('CodeBitNegateAssignExpr', () {
    run(
      CodeBitNegateAssignExpr.of('a', 'b'),
      '"a" ~= "b"',
    );
  });
  test('CodeLogicalNotExpr', () {
    run(
      CodeLogicalNotExpr.of('a'),
      '!"a"',
    );
  });
  test('CodeLogicalAndExpr', () {
    run(
      CodeLogicalAndExpr.of('a', 'b'),
      '"a" && "b"',
    );
  });
  test('CodeLogicalOrExpr', () {
    run(
      CodeLogicalOrExpr.of('a', 'b'),
      '"a" || "b"',
    );
  });
  test('CodeConditionalExpr', () {
    run(
      CodeConditionalExpr.of('a', 'b', 'c'),
      '"a" ? "b" : "c"',
    );
  });
  test('CodeConditionalNullExpr', () {
    run(
      CodeConditionalNullExpr.of('a', 'b'),
      '"a" ?? "b"',
    );
  });
  test('CodeAccessExpr', () {
    run(
      CodeAccessExpr.of('a', 'b'),
      '"a"."b"',
    );
  });
  test('CodeCascadeExpr', () {
    run(
      CodeCascadeExpr.of('a'),
      '.."a"',
    );
  });
  test('CodeConditionalAccessExpr', () {
    run(
      CodeConditionalAccessExpr.of('a', 'b'),
      '"a"?."b"',
    );
  });

  test('CodeListAccessExpr', () {
    run(
      CodeListAccessExpr.of('a', 'b'),
      '"a"["b"]',
    );
  });

  test('CodeArrowExpr', () {
    run(
      CodeArrowExpr.of('a'),
      ' => "a"',
    );
  });
}
