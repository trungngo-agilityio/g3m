import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_markdown.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  void run(Node root, String expected) {
    runAndExpect(MarkdownCodeConfig(root), expected);
  }

  test('null', () {
    run(MarkdownCode(null), '');
  });

  test('empty', () {
    run(MarkdownCode(''), '');
  });

  test('simple', () {
    run(MarkdownCode('hello'), '`hello`');
  });
}
