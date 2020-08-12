import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () {
    var code = JavaCode(
      CodeVar.of('name', type: 'string'),
    );

    runAndExpect(
      code,
      'String name',
    );
  });

  test('with string init', () {
    var code = JavaCode(
      CodeVar.of('string',
          type: 'name', init: CodeStringLiteral.of('john doe')),
    );

    runAndExpect(
      code,
      'String name = "John Doe"\n',
    );
  });
}
