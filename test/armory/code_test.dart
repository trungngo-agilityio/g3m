import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  group('CodeComment', () {
    test('double splash', () {
      final root = CodeCommentConfig.doubleSplash(CodeComment.of(
        text: 'hello',
      ));

      runAndExpect(root, '// hello\n');
    });

    test('triple splash', () {
      final root = CodeCommentConfig.tripleSplash(CodeComment.of(
        text: 'hello',
      ));

      runAndExpect(root, '/// hello\n');
    });

    test('hash', () {
      final root = CodeCommentConfig.hash(CodeComment.of(
        text: 'hello',
      ));

      runAndExpect(root, '# hello\n');
    });

    test('java doc', () {
      final root = CodeCommentConfig.javaDoc(CodeComment.of(
        text: 'hello',
      ));

      runAndExpect(root, '/**\n * hello\n */\n');
    });
  });
}
