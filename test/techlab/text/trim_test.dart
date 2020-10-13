import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test('left', () {
    var text = Trim.left(' A B C ');
    runAndExpect(text, 'A B C ');
  });

  test('right', () {
    var text = Trim.right(' A B C ');
    runAndExpect(text, ' A B C');
  });

  test('left & right', () {
    var text = Trim.leftRight(Text(' A B C '));
    runAndExpect(text, 'A B C');
  });
}
