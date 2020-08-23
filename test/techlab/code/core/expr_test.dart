import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(Node node, String expected) {
    var code = JavaCode(node);
    runAndExpect(code, expected);
  }

  test('simple text', () {
    run(
      CodeExpr.of('hello world'),
      '"hello world"',
    );
  });

  test('node', () {
    run(
      CodeExpr.of(Text.of('hello world')),
      'hello world',
    );
  });

  test('container, with sub expr', () {
    run(
      CodeExpr.of(Container([
        CodeExpr.of(1),
        ' ',
        CodeExpr.of(true),
        ' ',
        CodeExpr.of('world'),
      ])),
      '1 true "world"',
    );
  });
}
