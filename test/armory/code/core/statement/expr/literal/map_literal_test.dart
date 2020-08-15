import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../../../utils.dart';

void main() {
  test('null', () {
    var code = JavaCodeConfig(
      CodeMapLiteral.of(null),
    );

    runAndExpect(
      code,
      'null',
    );
  });

  test('empty array', () {
    var code = JavaCodeConfig(
      CodeMapLiteral.of({}),
    );

    runAndExpect(
      code,
      '{}',
    );
  });

  test('non empty array', () async {
    var code = JavaCodeConfig(
      CodeMapLiteral.of({
        'bool': true,
        'name': null,
        'string': 'A',
      }),
    );

    await runAndExpect(
      code,
      '{\n'
      '  "bool": true,\n'
      '  "name": null,\n'
      '  "string": "A"\n'
      '}',
    );
  });
}
