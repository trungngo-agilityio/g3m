import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test('first', () {
    var text = Text.of('hello world');
    var replace = TextReplace.first('hello', 'bye', text);
    runAndExpect(replace, 'bye world');
  });

  test('all', () {
    var text = Text.of('hello world');
    var replace = TextReplace.all('o', 'O', text);
    runAndExpect(replace, 'hellO wOrld');
  });

  test('range', () {
    var text = Text.of('hello world');
    var replace = TextReplace.range(5, 6, '-', text);
    runAndExpect(replace, 'hello-world');
  });
}
