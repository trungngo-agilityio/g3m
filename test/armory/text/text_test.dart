import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('Text', () {
    test('empty', () {
      var text = Text.of('');
      runAndExpect(text, '');
    });

    test('non empty', () {
      var text = Text.of('hello world');
      runAndExpect(text, 'hello world');
    });
  });

  test('newline', () {
    var text = NewLine();
    runAndExpect(text, '\n');
  });

  group('Text transform', () {
    test('TextTransform', () {
      var text = TextTransform(Text.of('world'), (s) => 'hello $s');
      runAndExpect(text, 'hello world');
    });

    test('UpperCase', () {
      var text = UpperCase(Text.of('hello world'));
      runAndExpect(text, 'HELLO WORLD');
    });

    test('LowerCase', () {
      var text = LowerCase(Text.of('HELLO WORLD'));
      runAndExpect(text, 'hello world');
    });

    test('CamelCase', () {
      var text = CamelCase(Text.of('hello world'));
      runAndExpect(text, 'helloWorld');
    });

    test('PascalCase', () {
      var text = PascalCase(Text.of('hello world'));
      runAndExpect(text, 'HelloWorld');
    });

    test('SnakeCase', () {
      var text = SnakeCase(Text.of('hello world'));
      runAndExpect(text, 'hello_world');
    });

    test('DotCase', () {
      var text = DotCase(Text.of('hello world'));
      runAndExpect(text, 'hello.world');
    });

    test('PathCase', () {
      var text = PathCase(Text.of('hello world'));
      runAndExpect(text, 'hello/world');
    });

    test('ParamCase', () {
      var text = ParamCase(Text.of('hello world'));
      runAndExpect(text, 'hello-world');
    });

    test('HeaderCase', () {
      var text = HeaderCase(Text.of('hello world'));
      runAndExpect(text, 'Hello-World');
    });

    test('TitleCase', () {
      var text = TitleCase(Text.of('hello world'));
      runAndExpect(text, 'Hello World');
    });

    test('ConstantCase', () {
      var text = ConstantCase(Text.of('hello world'));
      runAndExpect(text, 'HELLO_WORLD');
    });

    test('SentenceCase', () {
      var text = SentenceCase(Text.of('hello world'));
      runAndExpect(text, 'Hello world');
    });
  });

  group('Indent', () {
    group('Level', () {
      test('1 line', () {
        var text = IndentConfig.useTab(Indent(Text.of('hello'), level: 2));
        runAndExpect(text, '\t\thello');
      });

      test('multi lines', () {
        var text =
            IndentConfig.useTab(Indent(Text.of('hello\nworld'), level: 2));
        runAndExpect(text, '\t\thello\n\t\tworld');
      });
    });

    group('Tab', () {
      test('1 line', () {
        var text = IndentConfig.useTab(Indent(Text.of('hello')));
        runAndExpect(text, '\thello');
      });

      test('multi lines', () {
        var text = IndentConfig.useTab(Indent(Text.of('hello\nworld')));
        runAndExpect(text, '\thello\n\tworld');
      });
    });

    group('Space 2', () {
      test('1 line', () {
        var text = IndentConfig.useSpace2(Indent(Text.of('hello')));
        runAndExpect(text, '  hello');
      });

      test('multi lines', () {
        var text = IndentConfig.useSpace2(Indent(Text.of('hello\nworld')));
        runAndExpect(text, '  hello\n  world');
      });
    });

    group('Space 4', () {
      test('1 line', () {
        var text = IndentConfig.useSpace4(Indent(Text.of('hello')));
        runAndExpect(text, '    hello');
      });

      test('multi lines', () {
        var text = IndentConfig.useSpace4(Indent(Text.of('hello\nworld')));
        runAndExpect(text, '    hello\n    world');
      });
    });
  });

  group('Trim', () {
    test('left', () {
      var text = Trim.left(Text.of(' A B C '));
      runAndExpect(text, 'A B C ');
    });

    test('right', () {
      var text = Trim.right(Text.of(' A B C '));
      runAndExpect(text, ' A B C');
    });

    test('left & right', () {
      var text = Trim.leftRight(Text.of(' A B C '));
      runAndExpect(text, 'A B C');
    });
  });

  group('Pad', () {
    test('left', () {
      var text = Pad.left('*', Text.of('A'));
      runAndExpect(text, '*A');
    });

    test('right', () {
      var text = Pad.right('*', Text.of('A'));
      runAndExpect(text, 'A*');
    });

    test('of', () {
      var text = Pad.of('^', '*', Text.of('A'));
      runAndExpect(text, '^A*');
    });

    test('curly brackets', () {
      var text = Pad.curlyBrackets(Text.of('A'));
      runAndExpect(text, '{A}');
    });

    test('square brackets', () {
      var text = Pad.squareBrackets(Text.of('A'));
      runAndExpect(text, '[A]');
    });

    test('parentheses brackets', () {
      var text = Pad.parentheses(Text.of('A'));
      runAndExpect(text, '(A)');
    });

    test('angle brackets', () {
      var text = Pad.angleBrackets(Text.of('A'));
      runAndExpect(text, '<A>');
    });

    test('single quotes', () {
      var text = Pad.singleQuotes(Text.of('A'));
      runAndExpect(text, '\'A\'');
    });

    test('double quotes', () {
      var text = Pad.doubleQuotes(Text.of('A'));
      runAndExpect(text, '"A"');
    });
    group('always', () {});

    group('only if missing', () {
      test('left', () {
        var text = Pad.left('*', Text.of('*A'), onlyIfMissing: true);
        runAndExpect(text, '*A');
      });

      test('right', () {
        var text = Pad.right('*', Text.of('A*'), onlyIfMissing: true);
        runAndExpect(text, 'A*');
      });

      test('of', () {
        var text = Pad.of('^', '*', Text.of('^A*'), onlyIfMissing: true);
        runAndExpect(text, '^A*');
      });

      test('curly brackets', () {
        var text = Pad.curlyBrackets(Text.of('{A}'), onlyIfMissing: true);
        runAndExpect(text, '{A}');
      });

      test('square brackets', () {
        var text = Pad.squareBrackets(Text.of('[A]'), onlyIfMissing: true);
        runAndExpect(text, '[A]');
      });

      test('parentheses brackets', () {
        var text = Pad.parentheses(Text.of('(A)'), onlyIfMissing: true);
        runAndExpect(text, '(A)');
      });

      test('angle brackets', () {
        var text = Pad.angleBrackets(Text.of('<A>'), onlyIfMissing: true);
        runAndExpect(text, '<A>');
      });

      test('single quotes', () {
        var text = Pad.singleQuotes(Text.of('\'A\''), onlyIfMissing: true);
        runAndExpect(text, '\'A\'');
      });

      test('double quotes', () {
        var text = Pad.doubleQuotes(Text.of('"A"'), onlyIfMissing: true);
        runAndExpect(text, '"A"');
      });
    });
  });

  group('Join', () {
    test('comma separated', () {
      var text = Join.commaSeparated([
        Text.of('A'),
        Text.of('B'),
        Text.of('C'),
      ]);
      runAndExpect(text, 'A, B, C');
    });

    test('space separated', () {
      var text = Join.spaceSeparated([
        Text.of('A'),
        Text.of('B'),
        Text.of('C'),
      ]);
      runAndExpect(text, 'A B C');
    });
  });
}
