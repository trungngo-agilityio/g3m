import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('comment', () {
    void run(Node Function() build, String expected) {
      var code = JavaCodeConfig(build());
      runAndExpect(code, expected);
    }

    test('empty', () {
      run(
        () => CodeClass.of('person'),
        '\n'
        'class Person {\n'
        '\n'
        '}\n',
      );
    });

    test('with code access', () {
      run(
        () => CodeClass.of(
          'person',
          private: true,
          abstract: true,
        ),
        '\n'
        'private abstract class Person {\n'
        '\n'
        '}\n',
      );
    });

    test('with comment', () {
      run(
        () => CodeClass.of(
          'person',
          comment: 'hello world',
        ),
        '\n'
        '/**\n'
        ' * hello world\n'
        ' */\n'
        'class Person {\n'
        '\n'
        '}\n',
      );
    });

    test('with field', () {
      run(
        () => CodeClass.of(
          'person',
          fields: [
            makeField('first name'),
          ],
        ),
        '\n'
        'class Person {\n'
        '  String firstName;\n'
        '}\n',
      );
    });

    test('with field list', () {
      run(
        () => CodeClass.of(
          'person',
          fields: [
            makeField('first name'),
            makeField('last name'),
          ],
        ),
        '\n'
        'class Person {\n'
        '  String firstName;\n'
        '\n'
        '  String lastName;\n'
        '}\n',
      );
    });

    test('with function list', () {
      run(
        () {
          return CodeClass.of(
            'person',
            functions: [
              makeFunction('hello world 1'),
              makeFunction('hello world 2'),
            ],
          );
        },
        '\n'
        'class Person {\n'
        '  /**\n'
        '   * test hello world 1\n'
        '   */\n'
        '  String helloWorld1(String name, Person other);\n'
        '\n'
        '  /**\n'
        '   * test hello world 2\n'
        '   */\n'
        '  String helloWorld2(String name, Person other);\n'
        '}\n',
      );
    });

    test('with all ', () {
      run(
        () {
          final generic = [
            CodeGenericParam.of(name: 't'),
          ];

          final extend = null;

          final implements = null;

          final fields = [
            makeField('first name'),
            makeField('last name'),
          ];

          final functions = [
            makeFunction('hello world 1'),
            makeFunction('hello world 2'),
          ];

          return CodeClass.of(
            'person',
            public: true,
            abstract: true,
            generic: generic,
            extend: extend,
            implements: implements,
            fields: fields,
            functions: functions,
          );
        },
        '\n'
        'public abstract class Person<T> {\n'
        '  String firstName;\n'
        '\n'
        '  String lastName;\n'
        '\n'
        '  /**\n'
        '   * test hello world 1\n'
        '   */\n'
        '  String helloWorld1(String name, Person other);\n'
        '\n'
        '  /**\n'
        '   * test hello world 2\n'
        '   */\n'
        '  String helloWorld2(String name, Person other);\n'
        '}\n',
      );
    });
  });
}

CodeField makeField(String name) => CodeField.of(
      name: name,
      type: 'string',
    );

CodeFunction makeFunction(String name) => CodeFunction.of(
      name: name,
      returns: ['string'],
      requiredArgs: [
        ['name', 'String'],
        ['other', 'Person'],
      ],
      comment: 'test $name',
    );
