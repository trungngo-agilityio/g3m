import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test('empty', () {
    var text = Mustache.of('', null);
    runAndExpect(text, '');
  });

  test('non empty', () {
    var text = Mustache.of('hello {{name}}', {'name': 'world'});
    runAndExpect(text, 'hello world');
  });
}
