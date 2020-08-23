import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('null', () {
    run(
      CodeArgList.of(required: null),
      '',
    );
  });

  test('empty', () {
    run(
      CodeArgList.of(required: ''),
      '',
    );
  });

  test('string', () {
    run(
      CodeArgList.of(required: 'hello world'),
      'helloWorld',
    );
  });

  test('node', () {
    run(
      CodeArgList.of(required: Text.of('hello world')),
      'helloWorld',
    );
  });

  test('name of another name', () {
    var anotherName = CodeEnumValueName.of(name: 'hello world');
    run(anotherName, 'HELLO_WORLD');
    run(
      CodeArgList.of(required: anotherName),
      'helloWorld',
    );
  });
}

void run(Node node, String expected) {
  var code = JavaCodeConfig(node);
  runAndExpect(code, expected);
}
