import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(Node node, String expected) async {
    var code = JavaCode(node);
    await runAndExpect(code, expected);
  }

  test('simple text', () {
    run(
      CodeExpr.of('hello world'),
      'hello world;\n',
    );
  });

  test('node', () {
    run(
      CodeExpr.of(Text.of('hello world')),
      'hello world;\n',
    );
  });

  test('container, with sub expr', () {
    run(
      CodeExpr.of(Container([
        CodeExpr.of('hello'),
        ' ',
        CodeExpr.of('world'),
      ])),
      'hello world;\n',
    );
  });
}
