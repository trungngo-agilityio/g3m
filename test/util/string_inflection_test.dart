import 'package:g3m/util.dart';
import 'package:test/test.dart';

void assertEq(String expected, String s) {
  expect(s.toString(), equals(expected));
}

void main() {
  test('pluralize', () {
    assertEq('dogs', StringFuncs.plural('dog'));
    assertEq('technologies', StringFuncs.plural('technology'));
  });

  test('singular', () {
    assertEq('dog', StringFuncs.singular('dogs'));
    assertEq('technology', StringFuncs.singular('technologies'));
  });

  test('past', () {
    assertEq('walked', StringFuncs.past('walk'));
    assertEq('did', StringFuncs.past('do'));
  });
}
