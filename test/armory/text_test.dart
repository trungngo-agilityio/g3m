import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  group('Text', () {
    test('empty', () {
      var text = Text('');
      runAndExpect(text, '');
    });

    test('non empty', () {
      var text = Text('hello world');
      runAndExpect(text, 'hello world');
    });
  });

  test('newline', () {
    var text = NewLine();
    runAndExpect(text, '\n');
  });

  group('Text transform', () {
    test('TextTransform', () {
      var text = TextTransform(Text('world'), (s) => 'hello $s');
      runAndExpect(text, 'hello world');
    });

    test('UpperCase', () {
      var text = UpperCase(Text('hello world'));
      runAndExpect(text, 'HELLO WORLD');
    });

    test('LowerCase', () {
      var text = LowerCase(Text('HELLO WORLD'));
      runAndExpect(text, 'hello world');
    });

    test('CamelCase', () {
      var text = CamelCase(Text('hello world'));
      runAndExpect(text, 'helloWorld');
    });

    test('PascalCase', () {
      var text = PascalCase(Text('hello world'));
      runAndExpect(text, 'HelloWorld');
    });

    test('SnakeCase', () {
      var text = SnakeCase(Text('hello world'));
      runAndExpect(text, 'hello_world');
    });

    test('DotCase', () {
      var text = DotCase(Text('hello world'));
      runAndExpect(text, 'hello.world');
    });

    test('PathCase', () {
      var text = PathCase(Text('hello world'));
      runAndExpect(text, 'hello/world');
    });

    test('ParamCase', () {
      var text = ParamCase(Text('hello world'));
      runAndExpect(text, 'hello-world');
    });

    test('HeaderCase', () {
      var text = HeaderCase(Text('hello world'));
      runAndExpect(text, 'Hello-World');
    });

    test('TitleCase', () {
      var text = TitleCase(Text('hello world'));
      runAndExpect(text, 'Hello World');
    });

    test('ConstantCase', () {
      var text = ConstantCase(Text('hello world'));
      runAndExpect(text, 'HELLO_WORLD');
    });

    test('SentenceCase', () {
      var text = SentenceCase(Text('hello world'));
      runAndExpect(text, 'Hello world');
    });
  });

  group('Indent', () {
    group('Level', () {
      test('1 line', () {
        var text = IndentationConfig.useTab(Indent(Text('hello'), level: 2));
        runAndExpect(text, '\t\thello');
      });

      test('multi lines', () {
        var text =
            IndentationConfig.useTab(Indent(Text('hello\nworld'), level: 2));
        runAndExpect(text, '\t\thello\n\t\tworld');
      });
    });

    group('Tab', () {
      test('1 line', () {
        var text = IndentationConfig.useTab(Indent(Text('hello')));
        runAndExpect(text, '\thello');
      });

      test('multi lines', () {
        var text = IndentationConfig.useTab(Indent(Text('hello\nworld')));
        runAndExpect(text, '\thello\n\tworld');
      });
    });

    group('Space 2', () {
      test('1 line', () {
        var text = IndentationConfig.useSpace2(Indent(Text('hello')));
        runAndExpect(text, '  hello');
      });

      test('multi lines', () {
        var text = IndentationConfig.useSpace2(Indent(Text('hello\nworld')));
        runAndExpect(text, '  hello\n  world');
      });
    });

    group('Space 4', () {
      test('1 line', () {
        var text = IndentationConfig.useSpace4(Indent(Text('hello')));
        runAndExpect(text, '    hello');
      });

      test('multi lines', () {
        var text = IndentationConfig.useSpace4(Indent(Text('hello\nworld')));
        runAndExpect(text, '    hello\n    world');
      });
    });
  });
}
