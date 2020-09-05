import 'package:g3m/util.dart';
import 'package:test/test.dart';

void assertEq(String expected, String s) {
  expect(s.toString(), equals(expected));
}

void main() {
  test('normal', () {
    var s = ' _hello world_ ';

    assertEq('helloWorld', ReCase(s).camel);
    assertEq('HelloWorld', ReCase(s).pascal);
    assertEq('hello_world', ReCase(s).snake);
    assertEq('hello.world', ReCase(s).dot);
    assertEq('hello/world', ReCase(s).path);
    assertEq('hello-world', ReCase(s).param);
    assertEq('Hello-World', ReCase(s).header);
    assertEq('Hello World', ReCase(s).title);
    assertEq('HELLO_WORLD', ReCase(s).constant);
    assertEq('Hello world', ReCase(s).sentence);
  });

  test('for code', () {
    var s = ' _hello world_ ';

    assertEq('_helloWorld_', ReCase.forCode(s).camel);
    assertEq('__', ReCase.forCode('__').camel);
    assertEq('_HelloWorld_', ReCase.forCode(s).pascal);
    assertEq('__', ReCase.forCode('__').pascal);
    assertEq('_hello_world_', ReCase.forCode(s).snake);
    assertEq('__', ReCase.forCode('__').snake);
    assertEq('hello.world', ReCase.forCode(s).dot);
    assertEq('hello/world', ReCase.forCode(s).path);
    assertEq('hello-world', ReCase.forCode(s).param);
    assertEq('Hello-World', ReCase.forCode(s).header);
    assertEq('Hello World', ReCase.forCode(s).title);
    assertEq('_HELLO_WORLD_', ReCase.forCode(s).constant);
    assertEq('__', ReCase.forCode('__').constant);
    assertEq('Hello world', ReCase.forCode(s).sentence);
  });
}
