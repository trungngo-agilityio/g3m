import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_dart.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('comment', () {
    void run(Node Function() build, String expected) {
      var code = DartCodeConfig(build());
      runAndExpect(code, expected);
    }

    test('empty', () {
      run(
        () => CodeMixin.of(name: 'person'),
        '\n'
        'mixin Person {\n'
        '\n'
        '}\n',
      );
    });

    test('with code access', () {
      run(
        () => CodeMixin.of(
          name: 'person',
          isPrivate: true,
          isAbstract: true,
        ),
        '\n'
        'abstract mixin _Person {\n'
        '\n'
        '}\n',
      );
    });

    test('with comment', () {
      run(
        () => CodeMixin.of(
          name: 'person',
          comment: 'hello world',
        ),
        '\n'
        '/// hello world\n'
        'mixin Person {\n'
        '\n'
        '}\n',
      );
    });

    test('with field', () {
      run(
        () => CodeMixin.of(
          name: 'person',
          fields: [
            makeField('first name'),
          ],
        ),
        '\n'
        'mixin Person {\n'
        '  String firstName;\n'
        '}\n',
      );
    });

    test('with field list', () {
      run(
        () => CodeMixin.of(
          name: 'person',
          fields: [
            makeField('first name'),
            makeField('last name'),
          ],
        ),
        '\n'
        'mixin Person {\n'
        '  String firstName;\n'
        '\n'
        '  String lastName;\n'
        '}\n',
      );
    });

    test('with function list', () {
      run(
        () {
          return CodeMixin.of(
            name: 'person',
            functions: [
              makeFunction('hello world 1'),
              makeFunction('hello world 2'),
            ],
          );
        },
        '\n'
        'mixin Person {\n'
        '  /// test hello world 1\n'
        '  String helloWorld1(String name, Person other);\n'
        '\n'
        '  /// test hello world 2\n'
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

          final on = null;

          final implements = null;

          final fields = [
            makeField('first name'),
            makeField('last name'),
          ];

          final functions = [
            makeFunction('hello world 1'),
            makeFunction('hello world 2'),
          ];

          return CodeMixin.of(
            name: 'person',
            isPublic: true,
            isAbstract: true,
            generic: generic,
            on: on,
            implements: implements,
            fields: fields,
            functions: functions,
          );
        },
        '\n'
        'abstract mixin Person<T> {\n'
        '  String firstName;\n'
        '\n'
        '  String lastName;\n'
        '\n'
        '  /// test hello world 1\n'
        '  String helloWorld1(String name, Person other);\n'
        '\n'
        '  /// test hello world 2\n'
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
