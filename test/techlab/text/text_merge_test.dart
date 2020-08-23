import 'package:g3m/g3techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test('simple', () {
    var text1 = Text.of('hello');
    var text2 = Text.of('world');
    var replace = TextMerge(
      func: (texts) => texts.join(' '),
      children: [text1, text2],
    );
    runAndExpect(replace, 'hello world');
  });
}
