import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () {
    var code = JavaCodeConfig(
      CodeFor.of(
        init: CodeVar.of(name: 'i', type: 'int'),
        condition: Text.of('i<10'),
        step: Text.of('i++'),
        body: ['print("Hello World!");'],
      ),
    );

    runAndExpect(
      code,
      'for (int i; i<10; i++) {\n'
      '  print("Hello World!");\n'
      '}\n',
    );
  });
}
