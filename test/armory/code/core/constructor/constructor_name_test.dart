import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_dart.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  void run(Node node, String expected) async {
    var code = DartCodeConfig(node);
    await runAndExpect(code, expected);
  }

  test('null', () {
    run(
      CodeConstructorName.of(null),
      '',
    );
  });

  test('empty', () {
    run(
      CodeConstructorName.of(''),
      '',
    );
  });

  test('string', () {
    run(
      CodeConstructorName.of('hello world'),
      'helloWorld',
    );
  });

  test('node', () {
    run(
      CodeConstructorName.of(Text.of('hello world')),
      'helloWorld',
    );
  });

  test('name of another name', () {
    // Runs with dart config
    var argName = CodeArgName.of('hello world');
    run(argName, 'helloWorld');
    run(
      CodeConstructorName.of(argName),
      'helloWorld',
    );
  });
}
