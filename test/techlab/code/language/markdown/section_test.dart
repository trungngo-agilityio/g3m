import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_markdown.dart';
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

  test('empty', () {
    run(
      MarkdownSection(
        title: 'Section 1',
        paragraphs: [],
      ),
      '\n'
      '# Section 1\n'
      '\n',
    );
  });

  test('one paragraph', () {
    run(
      MarkdownSection(
        title: 'Section 1',
        paragraphs: [
          paragraph(2),
        ],
      ),
      '\n'
      '# Section 1\n'
      '\n'
      'line 1\n'
      'line 2\n'
      '\n',
    );
  });

  test('more than one paragraph', () {
    run(
      MarkdownSection(
        title: 'Section 1',
        paragraphs: [
          paragraph(2),
          paragraph(2),
        ],
      ),
      '\n'
      '# Section 1\n'
      '\n'
      'line 1\n'
      'line 2\n'
      '\n'
      'line 3\n'
      'line 4\n'
      '\n',
    );
  });

  test('with one nested section', () {
    run(
      MarkdownSection(
        title: 'Section 1',
        paragraphs: [
          paragraph(2),
          paragraph(2),
        ],
        sections: [
          MarkdownSection(
            title: 'Section 1.1',
            paragraphs: [
              paragraph(2),
              paragraph(2),
            ],
          ),
        ],
      ),
      '\n'
      '# Section 1\n'
      '\n'
      'line 1\n'
      'line 2\n'
      '\n'
      'line 3\n'
      'line 4\n'
      '\n'
      '\n'
      '## Section 1.1\n'
      '\n'
      'line 5\n'
      'line 6\n'
      '\n'
      'line 7\n'
      'line 8\n'
      '\n'
      '',
    );
  });

  test('with more than one nested section', () {
    run(
      MarkdownSection(title: 'Section 1', paragraphs: [
        paragraph(2),
        paragraph(2),
      ], sections: [
        MarkdownSection(title: 'Section 1.1', paragraphs: [
          paragraph(2),
          paragraph(2),
        ], sections: [
          MarkdownSection(
            title: 'Section 1.1.1',
            paragraphs: [
              paragraph(2),
              paragraph(2),
            ],
          ),
          MarkdownSection(
            title: 'Section 1.1.2',
            paragraphs: [
              paragraph(2),
              paragraph(2),
            ],
          ),
        ]),
        MarkdownSection(
          title: 'Section 1.2',
          paragraphs: [
            paragraph(2),
            paragraph(2),
          ],
        )
      ]),
      '\n'
      '# Section 1\n'
      '\n'
      'line 1\n'
      'line 2\n'
      '\n'
      'line 3\n'
      'line 4\n'
      '\n'
      '\n'
      '## Section 1.1\n'
      '\n'
      'line 5\n'
      'line 6\n'
      '\n'
      'line 7\n'
      'line 8\n'
      '\n'
      '\n'
      '### Section 1.1.1\n'
      '\n'
      'line 9\n'
      'line 10\n'
      '\n'
      'line 11\n'
      'line 12\n'
      '\n'
      '\n'
      '### Section 1.1.2\n'
      '\n'
      'line 13\n'
      'line 14\n'
      '\n'
      'line 15\n'
      'line 16\n'
      '\n'
      '\n'
      '## Section 1.2\n'
      '\n'
      'line 17\n'
      'line 18\n'
      '\n'
      'line 19\n'
      'line 20\n'
      '\n',
    );
  });
}
