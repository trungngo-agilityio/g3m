import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_markdown.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  void run(Node root, String expected) {
    runAndExpect(MarkdownCodeConfig(root), expected);
  }

  test('null', () {
    run(MarkdownBold(null), '');
  });

  test('empty', () {
    run(MarkdownBold(''), '');
  });

  test('simple', () {
    run(MarkdownBold('hello'), '**hello**');
  });
}
