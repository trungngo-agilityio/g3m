import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test('empty', () {
    var container = Container([]);
    runAndExpect(container, '');
  });

  test('non empty', () {
    var container = Container([Text('hello')]);
    runAndExpect(container, 'hello');
  });

  test('non empty, with null', () {
    var container = Container([null, Text('hello'), null]);
    runAndExpect(container, 'hello');
  });
}
