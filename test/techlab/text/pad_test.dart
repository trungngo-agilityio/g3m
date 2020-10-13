import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test('left', () {
    var text = Pad.left('*', 'A');
    runAndExpect(text, '*A');
  });

  test('right', () {
    var text = Pad.right('*', 'A');
    runAndExpect(text, 'A*');
  });

  test('of', () {
    var text = Pad.of('^', '*', 'A');
    runAndExpect(text, '^A*');
  });

  test('curly brackets', () {
    var text = Pad.curlyBrackets('A');
    runAndExpect(text, '{A}');
  });

  test('square brackets', () {
    var text = Pad.squareBrackets('A');
    runAndExpect(text, '[A]');
  });

  test('parentheses brackets', () {
    var text = Pad.parentheses('A');
    runAndExpect(text, '(A)');
  });

  test('angle brackets', () {
    var text = Pad.angleBrackets('A');
    runAndExpect(text, '<A>');
  });

  test('single quotes', () {
    var text = Pad.singleQuotes('A');
    runAndExpect(text, '\'A\'');
  });

  test('double quotes', () {
    var text = Pad.doubleQuotes('A');
    runAndExpect(text, '"A"');
  });
  group('always', () {});

  group('only if missing', () {
    test('left', () {
      var text = Pad.left('*', Text('*A'), onlyIfMissing: true);
      runAndExpect(text, '*A');
    });

    test('right', () {
      var text = Pad.right('*', Text('A*'), onlyIfMissing: true);
      runAndExpect(text, 'A*');
    });

    test('of', () {
      var text = Pad.of('^', '*', Text('^A*'), onlyIfMissing: true);
      runAndExpect(text, '^A*');
    });

    test('curly brackets', () {
      var text = Pad.curlyBrackets(Text('{A}'), onlyIfMissing: true);
      runAndExpect(text, '{A}');
    });

    test('square brackets', () {
      var text = Pad.squareBrackets(Text('[A]'), onlyIfMissing: true);
      runAndExpect(text, '[A]');
    });

    test('parentheses brackets', () {
      var text = Pad.parentheses(Text('(A)'), onlyIfMissing: true);
      runAndExpect(text, '(A)');
    });

    test('angle brackets', () {
      var text = Pad.angleBrackets(Text('<A>'), onlyIfMissing: true);
      runAndExpect(text, '<A>');
    });

    test('single quotes', () {
      var text = Pad.singleQuotes(Text('\'A\''), onlyIfMissing: true);
      runAndExpect(text, '\'A\'');
    });

    test('double quotes', () {
      var text = Pad.doubleQuotes(Text('"A"'), onlyIfMissing: true);
      runAndExpect(text, '"A"');
    });
  });
}
