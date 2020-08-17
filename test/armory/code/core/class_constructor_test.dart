import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(Node child, String expected) async {
    var code = JavaCodeConfig(CodeClass.of('person', body: child));
    await runAndExpect(code, expected);
  }

  test('hello', () async {
    await run(
      CodeClassConstructor.simple(
        comment: 'Just a sample\n'
            'Another line.\n'
            'Another line.',
        public: true,
        body: Container(['var a = 1;']),
      ),
      '\n'
      'class Person {\n'
      '  /**\n'
      '   * Just a sample\n'
      '   * Another line.\n'
      '   * Another line.\n'
      '   */\n'
      '  public Person() {\n'
      '    var a = 1;\n'
      '  }\n'
      '}\n',
    );
  });
}
