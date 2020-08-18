import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_dart.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('empty', () {
    run(
      CodeArgName.of(name: ''),
      '',
    );
  });

  test('string', () {
    run(
      CodeArgName.of(name: 'hello world'),
      'helloWorld',
    );
  });

  test('node', () {
    run(
      CodeArgName.of(name: Text.of('hello world')),
      'helloWorld',
    );
  });

  test('name of another name', () {
    var anotherName = CodeEnumValueName.of(name: 'hello world');
    run(anotherName, 'HELLO_WORLD');
    run(
      CodeArgName.of(name: anotherName),
      'helloWorld',
    );
  });

  test('with java private final', () {
    run(
      CodeArgName.of(
        name: 'hello',
        isPrivate: true,
      ),
      'hello',
    );
  });

  test('with dart private final', () {
    run(
      DartCodeConfig(CodeArgName.of(
        name: 'hello',
        isPrivate: true,
      )),
      '_hello',
    );
  });
}

void run(Node node, String expected) {
  var code = JavaCodeConfig(node);
  runAndExpect(code, expected);
}
