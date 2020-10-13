import 'dart:io';

import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_yaml.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  test('all', () {
    var root = Directory.temp(
      'g3techlab',
      YmlCodeFile.of(
        'yml-demo1',
        body: {
          'name': 'john',
          'age': 20,
          'male': true,
          'node': Text('"can put anything here"'),
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
    runAndExpect(root, '');
  });
}
