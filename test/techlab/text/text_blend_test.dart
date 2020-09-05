import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test('simple', () {
    var m1 = '###';
    var text1 = Text.of(
      'hello $m1 john!',
    );
    var text2 = Text.of(
      'bye $m1 tim',
    );
    var node = TextBlend(
      markers: [m1],
      oldContent: text1,
      newContent: text2,
    );
    runAndExpect(node, 'hello $m1 tim');
  });

  test('two, and new goes first', () {
    var m1 = '###';
    var text1 = Text.of(
      'hello $m1 john $m1 doe!',
    );
    var text2 = Text.of(
      'bye $m1 tim $m1 smith!',
    );
    var node = TextBlend(
      markers: [m1, m1],
      oldContent: text1,
      newContent: text2,
      newContentFirst: true,
    );
    runAndExpect(node, 'bye $m1 john $m1 smith!');
  });
}
