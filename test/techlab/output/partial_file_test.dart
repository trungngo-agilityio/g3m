import 'dart:io' as io;

import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test('empty', () {
    final name = 'partial_file.txt';
    // delete the temp file first.
    final file = io.File('/tmp/${name}');
    file.writeAsStringSync('Hello<content>World</content>. This remained!');

    var root = Directory.absolute(
      '/tmp',
      Container([
        PartialFile(
          name,
          markers: ['<content>', '</content>'],
          content: Text('Ignored <content>John!</content> ignored.'),
        ),
      ]),
    );
    runAndExpect(root);

    final s = file.readAsStringSync();
    expect(
      s,
      'Hello<content>John!</content>. This remained!',
    );
  });
}
