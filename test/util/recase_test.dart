import 'package:g3m/util.dart';
import 'package:test/test.dart';

void assertEq(String expected, String s) {
  expect(s.toString(), equals(expected));
}

void main() {
  test('normal', () {
    var s = ' _hello world_ ';

    assertEq('helloWorld', ReCase(s).camelCase);
    assertEq('HelloWorld', ReCase(s).pascalCase);
    assertEq('hello_world', ReCase(s).snakeCase);
    assertEq('hello.world', ReCase(s).dotCase);
    assertEq('hello/world', ReCase(s).pathCase);
    assertEq('hello-world', ReCase(s).paramCase);
    assertEq('Hello-World', ReCase(s).headerCase);
    assertEq('Hello World', ReCase(s).titleCase);
    assertEq('HELLO_WORLD', ReCase(s).constantCase);
    assertEq('Hello world', ReCase(s).sentenceCase);
  });

  test('for code', () {
    var s = ' _hello world_ ';

    assertEq('_helloWorld_', ReCase.forCode(s).camelCase);
    assertEq('__', ReCase.forCode('__').camelCase);
    assertEq('_HelloWorld_', ReCase.forCode(s).pascalCase);
    assertEq('__', ReCase.forCode('__').pascalCase);
    assertEq('_hello_world_', ReCase.forCode(s).snakeCase);
    assertEq('__', ReCase.forCode('__').snakeCase);
    assertEq('hello.world', ReCase.forCode(s).dotCase);
    assertEq('hello/world', ReCase.forCode(s).pathCase);
    assertEq('hello-world', ReCase.forCode(s).paramCase);
    assertEq('Hello-World', ReCase.forCode(s).headerCase);
    assertEq('Hello World', ReCase.forCode(s).titleCase);
    assertEq('_HELLO_WORLD_', ReCase.forCode(s).constantCase);
    assertEq('__', ReCase.forCode('__').constantCase);
    assertEq('Hello world', ReCase.forCode(s).sentenceCase);
  });
}
