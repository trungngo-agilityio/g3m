import 'package:g3m/g3gen.dart';
import 'package:test/test.dart';

void main() {
  test('name', () {
    var doc = TextDoc();

    var p1 = doc.top;
    var w = p1.writer;
    w + 'paragraph 1';

    var p3 = doc.bottom.after();
    w = p3.writer;
    w + 'paragraph 3';

    var p2 = p3.before();
    w = p2.writer;
    w + 'paragraph 2';

    var p4 = p3.after();
    w = p4.writer;
    w + 'paragraph 4';

    print(doc.content);
  });
}
