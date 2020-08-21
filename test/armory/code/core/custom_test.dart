import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(Node node, String expected) {
    var code = JavaCodeConfig(node);
    runAndExpect(code, expected);
  }

  test('no child', () {
    run(
      CodeCustom(null),
      '\n'
      '// region custom code\n'
      '\n'
      '// endregion custom code',
    );
  });

  test('with child', () {
    run(
      CodeCustom(CodeComment.of('hello world')),
      '\n'
      '// region custom code\n'
      '// hello world\n'
      '\n'
      '// endregion custom code',
    );
  });
}
