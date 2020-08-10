import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('space', () {
    test('no space', () {
      var code = CodeSpace(Text('hello'));
      runAndExpect(
        code,
        ' hello',
      );
    });

    test('with space', () {
      var code = CodeSpace(Text(' hello'));
      runAndExpect(
        code,
        ' hello',
      );
    });

    test('with newline', () {
      var code = CodeSpace(Text('\nhello'));
      runAndExpect(
        code,
        '\nhello',
      );
    });
  });

  group('new line', () {
    test('no new line', () {
      var code = CodeNewLine(Text('hello'));
      runAndExpect(
        code,
        '\nhello',
      );
    });
  });
}
