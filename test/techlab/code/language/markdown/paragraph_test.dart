import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_markdown.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  void run(Node root, String expected) {
    runAndExpect(MarkdownCodeConfig(root), expected);
  }

  test('null', () {
    run(MarkdownParagraph(null), '');
  });

  test('empty', () {
    run(MarkdownParagraph([]), '');
  });

  test('one line', () {
    run(MarkdownParagraph(['hello world']), 'hello world\n\n');
  });

  test('more than one line', () {
    run(
        MarkdownParagraph([
          'hello world',
          'john doe',
        ]),
        'hello world\njohn doe\n\n');
  });
}
