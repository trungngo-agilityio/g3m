import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test('empty', () {
    var container = Container([]);
    runAndExpect(container, '');
  });

  test('non empty', () {
    var container = Container([Text('hello'), 1, null]);
    runAndExpect(container, 'hello1');
  });

  test('non empty, with null', () {
    var container = Container([null, 'hello', null]);
    runAndExpect(container, 'hello');
  });
}
