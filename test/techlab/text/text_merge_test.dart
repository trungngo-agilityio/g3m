import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test('simple', () {
    var text1 = Text('hello');
    var text2 = Text('world');
    var replace = TextMerge(
      func: (texts) => texts.join(' '),
      children: [text1, text2],
    );
    runAndExpect(replace, 'hello world');
  });
}
