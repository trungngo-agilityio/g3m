import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test('first', () {
    var text = Text('hello world');
    var replace = TextReplace.first('hello', 'bye', text);
    runAndExpect(replace, 'bye world');
  });

  test('all', () {
    var text = Text('hello world');
    var replace = TextReplace.all('o', 'O', text);
    runAndExpect(replace, 'hellO wOrld');
  });

  test('range', () {
    var text = 'hello world';
    var replace = TextReplace.range(5, 6, '-', text);
    runAndExpect(replace, 'hello-world');
  });
}
