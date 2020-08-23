import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('empty', () {
    run(
      CodeEnumValueName.of(name: ''),
      '',
    );
  });

  test('string', () {
    run(
      CodeEnumValueName.of(name: 'hello world'),
      'HELLO_WORLD',
    );
  });

  test('node', () {
    run(
      CodeEnumValueName.of(name: Text.of('hello world')),
      'HELLO_WORLD',
    );
  });

  test('name of another name', () {
    // Runs with dart config
    var argName = CodeArgName.of(name: 'hello world');
    run(argName, 'helloWorld');
    run(
      CodeEnumValueName.of(name: argName),
      'HELLO_WORLD',
    );
  });
}

void run(Node node, String expected) {
  var code = JavaCodeConfig(node);
  runAndExpect(code, expected);
}
