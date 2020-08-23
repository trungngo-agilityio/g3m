import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () {
    var code = JavaCodeConfig(
      CodeVar.of(name: 'name', type: 'string'),
    );

    runAndExpect(
      code,
      'String name',
    );
  });

  test('with string init', () {
    var code = JavaCodeConfig(
      CodeVar.of(
        name: 'name',
        type: 'string',
        init: CodeStringLiteral.of('john doe'),
      ),
    );

    runAndExpect(
      code,
      'String name = "john doe"',
    );
  });
}
