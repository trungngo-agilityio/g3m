import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(String text, String expected) {
    var code = IndentConfig.useSpace2(Indent(Text.of(text)));
    runAndExpect(code, expected);
  }

  test('empty', () {
    run('', '');
  });

  test('1 line', () {
    run('hello', '  hello');
  });

  test('2 line', () {
    run(
      'hello\nworld',
      '  hello\n'
          '  world',
    );
  });

  test('with empty lines', () {
    run(
      'hello\n\nworld',
      '  hello\n'
          '\n'
          '  world',
    );
  });

  test('start with new line', () {
    run(
      '\nhello\n\nworld',
      '  hello\n'
          '\n'
          '  world',
    );
  });

  test('end with new line', () {
    run(
      'hello\n\nworld\n',
      '  hello\n'
          '\n'
          '  world',
    );
  });
}
