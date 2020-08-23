import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  void run(Node child, String expected) {
    var code = JavaCodeConfig(CodeClass.of(name: 'person', body: child));
    runAndExpect(code, expected);
  }

  test('body test', () {
    run(
      CodeConstructor.of(
        comment: 'Just a sample\n'
            'Another line.\n'
            'Another line.',
        public: true,
        requiredArgs: [
          ['first name', 'string', 'john doe']
        ],
        body: 'var a = 1;',
      ),
      '\n'
      'class Person {\n'
      '  /**\n'
      '   * Just a sample\n'
      '   * Another line.\n'
      '   * Another line.\n'
      '   */\n'
      '  public Person(String firstName = "john doe") {\n'
      '    var a = 1;\n'
      '  }\n'
      '}\n',
    );
  });
}
