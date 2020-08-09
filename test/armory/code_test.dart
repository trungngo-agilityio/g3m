import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test('comment - double splash', () {
    final root = CodeComment.of(
      style: CodeCommentStyle.doubleSplash,
      text: 'hello',
    );

    runAndExpect(root, '// hello\n');
  });

  test('comment - triple splash', () {
    final root = CodeComment.of(
      style: CodeCommentStyle.tripleSplash,
      text: 'hello',
    );

    runAndExpect(root, '/// hello\n');
  });

  test('comment - java doc', () {
    final root = CodeComment.of(
      style: CodeCommentStyle.javaDoc,
      text: 'hello',
    );

    runAndExpect(root, '/**\n * hello\n */\n');
  });
}
