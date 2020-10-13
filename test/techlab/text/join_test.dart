import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  final texts = [
    'A',
    Text('B'),
    'C',
  ];

  test('double newline separated', () {
    var text = Join.doubleNewLineSeparated(texts);
    runAndExpect(
      text,
      'A\n'
      '\n'
      'B\n'
      '\n'
      'C',
    );
  });

  test('newline separated', () {
    var text = Join.newLineSeparated(texts);
    runAndExpect(
      text,
      'A\n'
      'B\n'
      'C',
    );
  });

  test('comma newline separated', () {
    var text = Join.commaNewLineSeparated(texts);
    runAndExpect(
      text,
      'A,\n'
      'B,\n'
      'C',
    );
  });

  test('not separated', () {
    var text = Join.notSeparated(texts);
    runAndExpect(text, 'ABC');
  });

  test('comma separated', () {
    var text = Join.commaSeparated(texts);
    runAndExpect(text, 'A, B, C');
  });

  test('space separated', () {
    var text = Join.spaceSeparated(texts);
    runAndExpect(text, 'A B C');
  });
}
