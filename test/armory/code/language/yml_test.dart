import 'dart:io';

import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test('all', () async {
    var root = Directory(
      '/tmp',
      YmlCodeFile.of(
        'yml-demo1',
        body: {
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
          },
        },
      ),
    );
    await runAndExpect(root, '');
  });
}
