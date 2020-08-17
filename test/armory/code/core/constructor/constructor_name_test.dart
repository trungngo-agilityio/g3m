import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  void run(Node node, String expected) async {
    var code = JavaCodeConfig(node);
    await runAndExpect(code, expected);
  }

  test('null', () {
    run(
      CodeAnnotationName.of(null),
      '',
    );
  });

  test('empty', () {
    run(
      CodeAnnotationName.of(''),
      '',
    );
  });

  test('string', () {
    run(
      CodeAnnotationName.of('hello'),
      'Hello',
    );
  });

  test('node', () {
    run(
      CodeAnnotationName.of(Text.of('hello')),
      'Hello',
    );
  });

  test('name of another name', () {
    var argName = CodeArgName.of('hello world');
    run(argName, 'helloWorld');
    run(
      CodeAnnotationName.of(
        // node that the arg name is camel case
        argName,
      ),
      'HelloWorld',
    );
  });
}
