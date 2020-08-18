import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('null', () {
    run(
      CodeEnumValueName.of(null),
      '',
    );
  });

  test('empty', () {
    run(
      CodeEnumValueName.of(''),
      '',
    );
  });

  test('string', () {
    run(
      CodeEnumValueName.of('hello world'),
      'HELLO_WORLD',
    );
  });

  test('node', () {
    run(
      CodeEnumValueName.of(Text.of('hello world')),
      'HELLO_WORLD',
    );
  });

  test('name of another name', () {
    // Runs with dart config
    var argName = CodeArgName.of('hello world');
    run(argName, 'helloWorld');
    run(
      CodeEnumValueName.of(argName),
      'HELLO_WORLD',
    );
  });
}

void run(Node node, String expected) {
  var code = JavaCodeConfig(node);
  runAndExpect(code, expected);
}
