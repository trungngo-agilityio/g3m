import 'package:g3m/g3armory.dart';
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
      runAndExpect(JavaCode(build()), expected);
    }

    test('field', () {
      run(
        () => CodeField.of(
          name: 'first name',
          type: 'string',
          comment: 'hello',
        ),
        '// hello\n'
        'String firstName;\n',
      );
    });

    test('function', () {
      run(
          () => CodeFunction.of(
                'world',
                comment: 'hello',
              ),
          '/**\n'
          ' * hello\n'
          ' */\n'
          'world();\n');
    });

    test('class', () {
      run(
          () => CodeClass.of(
                'world',
                comment: 'hello',
              ),
          '/**\n'
          ' * hello\n'
          ' */\n'
          'class World {\n'
          '  \n'
          '}\n');
    });

    test('statement', () {
      run(
        () => Container([
          CodeComment.of('world'),
          CodeStatement.of('hello'),
        ]),
        '// world\n'
        'hello;\n',
      );
    });
  });
}
