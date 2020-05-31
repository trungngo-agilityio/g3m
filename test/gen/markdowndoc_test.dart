import 'package:g3m/g3gen.dart';
import 'package:test/test.dart';

void main() {
  test('name', () {
    var doc = MarkdownDoc();
    doc.title = 'this is a demo mark down document.';

    doc.top
      ..title = 'paragraph 1 is a sentence'
      ..write((w) {
        w + 'Paragraph 1 content goes here.';
        w ^ mk.rule;
        w ^ 'Demo email: ' + mk.email % 'trungngo@gmail.com';
        w ^ 'Demo url: ' + mk.link() % 'http://www.google.com';
        w ^
            'Demo url + title: ' +
                mk.link('google.com') % 'http://www.google.com';
        w ^
            'Demo image: ' +
                mk.image() % 'http://www.google.com/some-image.png';
        w ^
            'Demo image + alt text: ' +
                mk.image('alt text') % 'http://www.google.com/some-image.png';
        w ^
            'Demo image + alt text + title: ' +
                mk.image('alt text', 'title') %
                    'http://www.google.com/some-image.png';
        w ^ 'Demo bold: ' + mk.bold % 'text';
        w ^ 'Demo italic: ' + mk.italic % 'text';
        w ^ 'Demo code: ' + mk.code % 'text';
      });

    var p3 = doc.bottom.after('Paragraph 3', (w) {
      w + 'Paragraph 3 content goes here.';
    });

    p3.before('Paragraph 2')
      ..write((w) {
        w + 'Paragraph 2 content goes here.';
        w ^ 'Second line.';

        w >> 'Sub item 2.1.';
        ~w + 'Sub item 2.2';
        ~w + 'Sub item 2.3';
        w ^ 'Just another line.\nAnd another line.';

        w >> 'Sub item 2.3.1.';
        ~w + 'Sub item 2.3.2';
        w ^ 'Just another line.\nAnd another line.';

        w << 'Sub item 2.4.';
        ~w + 'Sub item 2.5';
        ~w + 'Sub item 2.6';
        w ^ 'Just another line.\nAnd another line.';
      });

    p3.after('paragraph 4')
      ..write((w) {
        w + 'Paragraph 4 content goes here.';
      });

    print(doc.content);
  });
}
