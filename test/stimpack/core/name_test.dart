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
    assertEq('hello world', s.constant().words());
  });

  test('inflection functions', () {
    assertEq('dogs', StimName.of('dog').plural());
    assertEq('technologies', StimName.of('technology').plural());

    assertEq('dog', StimName.of('dogs').singular());
    assertEq('technology', StimName.of('technologies').singular());

    assertEq('walked', StimName.of('walk').past());
    assertEq('did', StimName.of('do').past());
  });

  test('operators', () {
    var s1 = StimName.of('hello world');
    var s2 = StimName.of('john doe');
    assertEq('hello world john doe', s1 >> s2);
    assertEq('john doe hello world', s1 << s2);
    assertEq('HelloWorld john_doe', s1.pascal() >> s2.snake());
    var s = (s1.pascal() >> s2.snake());

    // TODO: If we can get the HelloWorld/john_doe case, it is much better.
    // assertEq('HelloWorld/john_doe', s.path());
    assertEq('hello/world/john/doe', s.path());
  });
}
