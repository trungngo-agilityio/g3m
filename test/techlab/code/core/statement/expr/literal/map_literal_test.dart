import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_java.dart';
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

  test('non empty array', () {
    var code = JavaCodeConfig(
      CodeMapLiteral.of({
        'bool': true,
        'name': null,
        'string': 'A',
      }),
    );

    runAndExpect(
      code,
      '{\n'
      '  "bool": true,\n'
      '  "name": null,\n'
      '  "string": "A"\n'
      '}',
    );
  });

  test('non empty array', () {
    var code = JavaCodeConfig(
      CodeMapLiteral.of({
        'name': 'john',
        'age': 20,
        'male': true,
        'node': Text.of('"can put anything here"'),
        'array': [1, null, 'hello'],
        'object': {
          'name': 'mary',
          'age': 1,
          'male': 'false',
          'array': [10, null, 'hello'],
        }
      }),
    );

    runAndExpect(
      code,
      '{\n'
      '  "name": "john",\n'
      '  "age": 20,\n'
      '  "male": true,\n'
      '  "node": "can put anything here",\n'
      '  "array": [\n'
      '    1,\n'
      '    null,\n'
      '    "hello"\n'
      '  ],\n'
      '  "object": {\n'
      '    "name": "mary",\n'
      '    "age": 1,\n'
      '    "male": "false",\n'
      '    "array": [\n'
      '      10,\n'
      '      null,\n'
      '      "hello"\n'
      '    ]\n'
      '  }\n'
      '}',
    );
  });
}
