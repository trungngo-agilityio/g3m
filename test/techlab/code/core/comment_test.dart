import 'package:g3m/g3techlab_core.dart';
import 'package:g3m/g3techlab_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('by string transform', () {
    test('double splash', () {
      var code = CodeCommentConfig.doubleSplash(
        CodeComment.of('hello\nworld'),
      );
      runAndExpect(
        code,
        '// hello\n'
        '// world\n',
      );
    });

    test('triple splash', () {
      var code = CodeCommentConfig.tripleSplash(
        CodeComment.of('hello\nworld'),
      );
      runAndExpect(
        code,
        '/// hello\n'
        '/// world\n',
      );
    });

    test('hash', () {
      var code = CodeCommentConfig.hash(
        CodeComment.of('hello\nworld'),
      );
      runAndExpect(
        code,
        '# hello\n'
        '# world\n',
      );
    });

    test('java doc', () {
      var code = CodeCommentConfig.javaDoc(
        CodeComment.of('hello\nworld'),
      );
      runAndExpect(
        code,
        '/**\n'
        ' * hello\n'
        ' * world\n'
        ' */\n',
      );
    });
  });

  group('by code config', () {
    void run(Node Function() build, String expected) {
      runAndExpect(JavaCodeConfig(build()), expected);
    }

    test('field', () {
      run(
        () => CodeField.of(
          name: 'first name',
          type: 'string',
          comment: 'hello',
        ),
        '\n'
        '// hello\n'
        'String firstName',
      );
    });

    test('function', () {
      run(
        () => CodeFunction.of(
          name: 'world',
          comment: 'hello',
        ),
        '\n'
        '/**\n'
        ' * hello\n'
        ' */\n'
        'world()',
      );
    });

    test('class', () {
      run(
          () => CodeClass.of(
                name: 'world',
                comment: 'hello',
              ),
          '\n'
          '/**\n'
          ' * hello\n'
          ' */\n'
          'class World {\n'
          '\n'
          '}\n');
    });
  });
}
