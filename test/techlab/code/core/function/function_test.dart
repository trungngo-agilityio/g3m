import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  group('no body', () {
    test('name only', () {
      var code = JavaCodeConfig(
        CodeFunction.of(name: 'hello'),
      );
      runAndExpect(
        code,
        '\n'
        'hello()',
      );
    });

    test('with args', () {
      var code = JavaCodeConfig(
        CodeFunction.of(
          name: 'hello',
          requiredArgs: [
            ['name', 'String'],
            ['another', 'Person'],
          ],
        ),
      );
      runAndExpect(
        code,
        '\n'
        'hello(String name, Person another)',
      );
    });

    test('with return', () {
      var code = JavaCodeConfig(
        CodeFunction.of(
          name: 'hello',
          returns: ['string'],
        ),
      );
      runAndExpect(
        code,
        '\n'
        'String hello()',
      );
    });

    test('with annotation', () {
      var code = JavaCodeConfig(
        CodeFunction.of(
          name: 'hello',
          annotations: [
            CodeAnnotation.constructorCall(className: 'repository'),
            CodeAnnotation.constructorCall(
                className: 'repository', args: [1, false]),
          ],
        ),
      );
      runAndExpect(
        code,
        '\n'
        '@Repository()\n'
        '@Repository(1, false)\n'
        'hello()',
      );
    });

    test('with access', () {
      var code = JavaCodeConfig(
        CodeFunction.of(
          name: 'hello',
          isOverride: true,
          isPrivate: true,
          isStatic: true,
        ),
      );
      runAndExpect(
        code,
        '\n'
        '@override\n'
        'private static hello()',
      );
    });

    test('with generic', () {
      var code = JavaCodeConfig(
        CodeFunction.of(
          name: 'hello',
          generic: ['T'],
          requiredArgs: [
            ['name', 'T'],
          ],
        ),
      );
      runAndExpect(
        code,
        '\n'
        'hello<T>(T name)',
      );
    });

    test('with throw', () {
      var code = JavaCodeConfig(
        CodeFunction.of(
          name: 'hello',
          throws: ['invalid argument exception'],
        ),
      );
      runAndExpect(
        code,
        '\n'
        'hello() throws InvalidArgumentException',
      );
    });

    test('with all', () {
      var code = JavaCodeConfig(
        CodeFunction.of(
          name: 'hello',
          returns: ['string'],
          annotations: [
            CodeAnnotation.constructorCall(className: 'repository'),
            CodeAnnotation.constructorCall(
                className: 'repository', args: [1, false]),
          ],
          generic: ['t'],
          requiredArgs: {
            ['name', 'string'],
            ['another', 't'],
          },
          throws: ['invalid argument exception'],
        ),
      );
      runAndExpect(
        code,
        '\n'
        '@Repository()\n'
        '@Repository(1, false)\n'
        'String hello<T>({[name,String],[another,T]}) throws InvalidArgumentException',
      );
    });
  });

  group('with body', () {
    test('name only', () {
      var code = JavaCodeConfig(
        CodeFunction.of(
          name: 'hello',
          body: [
            '// some sample comment\n',
            'callAFunction();\n',
          ],
        ),
      );
      runAndExpect(
        code,
        '\n'
        'hello() {\n'
        '  // some sample comment\n'
        '  callAFunction();\n'
        '}',
      );
    });
  });
}
