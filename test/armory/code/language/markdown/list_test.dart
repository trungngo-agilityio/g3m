import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_markdown.dart';
import 'package:quiver/iterables.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  var lineStart = 0;

  MarkdownParagraph paragraph(int count) {
    var i = lineStart + 1;
    lineStart += count;
    return MarkdownParagraph(
      range(count).map((e) => 'line ${i++}').toList(),
    );
  }

  void run(Node root, String expected) {
    lineStart = 0;
    runAndExpect(MarkdownCodeConfig(root), expected);
  }

  test('null', () {
    run(
      MarkdownList(null),
      '',
    );
  });

  test('empty', () {
    run(
      MarkdownList([]),
      '',
    );
  });

  test('one item', () {
    run(
      MarkdownList([
        MarkdownListItem(body: paragraph(2)),
      ]),
      '\n'
      '* line 1\n'
      '  line 2\n'
      '',
    );
  });

  test('more than one item', () {
    run(
      MarkdownList([
        MarkdownListItem(body: paragraph(2)),
        MarkdownListItem(body: paragraph(2)),
      ]),
      '\n'
      '* line 1\n'
      '  line 2\n'
      '\n'
      '* line 3\n'
      '  line 4\n',
    );
  });

  test('with one nested item', () {
    run(
        MarkdownList([
          MarkdownListItem(body: paragraph(2)),
          MarkdownListItem(body: paragraph(2), lists: [
            MarkdownList([
              MarkdownListItem(body: paragraph(2)),
              MarkdownListItem(body: paragraph(2), lists: [
                MarkdownList([
                  MarkdownListItem(body: paragraph(2)),
                  MarkdownListItem(body: paragraph(2)),
                ]),
              ]),
            ]),
          ]),
        ]),
        '\n'
        '* line 1\n'
        '  line 2\n'
        '\n'
        '* line 3\n'
        '  line 4\n'
        '\n'
        '    * line 5\n'
        '      line 6\n'
        '\n'
        '    * line 7\n'
        '      line 8\n'
        '\n'
        '        * line 9\n'
        '          line 10\n'
        '\n'
        '        * line 11\n'
        '          line 12');
  });

  test('with more than one nested section', () {
    run(
      MarkdownList([
        MarkdownListItem(body: paragraph(2)),
        MarkdownListItem(body: paragraph(2), lists: [
          MarkdownList([
            MarkdownListItem(body: paragraph(2)),
            MarkdownListItem(body: paragraph(2), lists: [
              MarkdownList([
                MarkdownListItem(body: paragraph(2)),
                MarkdownListItem(body: paragraph(2)),
              ]),
            ]),
          ]),
        ]),
      ]),
      '\n'
      '* line 1\n'
      '  line 2\n'
      '\n'
      '* line 3\n'
      '  line 4\n'
      '\n'
      '    * line 5\n'
      '      line 6\n'
      '\n'
      '    * line 7\n'
      '      line 8\n'
      '\n'
      '        * line 9\n'
      '          line 10\n'
      '\n'
      '        * line 11\n'
      '          line 12',
    );
  });
}
