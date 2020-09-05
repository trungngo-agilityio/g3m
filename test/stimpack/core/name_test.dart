import 'package:g3m/stimpack_core.dart';
import 'package:test/test.dart';

void assertEq(String expected, StimName s) {
  expect(s.toString(), equals(expected));
}

void main() {
  test('string algebra', () {
    var s = StimName.of('');
    assertEq('', s & '');
    assertEq('A', s & 'A');
    assertEq('A', s & ' A ');
    assertEq('A B C', s & ' A B  C ');
    assertEq('A B C D E', s & ' A  B  C ' & '    D E  ');

    s = StimName.of('a');
    assertEq('a b c', s >> '  b  c ');
    assertEq('a b c', s.addRight('  b  c '));
    assertEq('b c a', s << '  b  c  ');
    assertEq('b c a', s.addLeft('  b  c  '));
    assertEq('b c', s ^ '  b  c  ');
    assertEq('b c', s.reset('  b  c  '));

    s = StimName.of('hello world hello');
    assertEq('world', s.remove('hello'));
  });

  test('string function', () {
    var s = StimName.of('hello') & 'world';

    assertEq('HELLO WORLD', s.upper());
    assertEq('helloWorld', s.camel());
    assertEq('HelloWorld', s.pascal());
    assertEq('hello_world', s.snake());
    assertEq('hello.world', s.dot());
    assertEq('hello/world', s.path());
    assertEq('hello-world', s.param());
    assertEq('Hello-World', s.header());
    assertEq('Hello World', s.title());
    assertEq('HELLO_WORLD', s.constant());
    assertEq('Hello world', s.sentence());
  });
}
