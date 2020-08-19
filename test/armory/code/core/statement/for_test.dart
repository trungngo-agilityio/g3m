import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () {
    var code = JavaCodeConfig(
      CodeFor.of(
        init: CodeVar.of('i', type: 'int'),
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
