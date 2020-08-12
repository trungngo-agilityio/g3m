import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

CodeField makeField(String name) => CodeField.of(
      name: name,
      type: 'string',
    );

CodeFunction makeFunction(String name) => CodeFunction.of(
      name,
      returns: ['string'],
      args: {
        'name': 'String',
        'other': 'Person',
      },
      comment: 'test $name',
    );

CodeClassExtend makeExtend(String name) {
  return CodeClassExtend(CodeType.simple(name));
}

CodeClassImplement makeImplement(String name) {
  return CodeClassImplement(CodeType.simple(name));
}

void main() {
  group('comment', () {
    void run(Node Function() build, String expected) {
      var code = JavaCode(build());
      runAndExpect(code, expected);
    }

    test('empty', () {
      run(
        () => CodeInterface.of(name: 'person'),
        'interface Person {\n'
        '  \n'
        '}\n',
      );
    });

    test('with code access', () {
      run(
        () => CodeInterface.of(
          name: 'person',
          access: CodeAccess.private(),
        ),
        'private interface Person {\n'
        '  \n'
        '}\n',
      );
    });

    test('with comment', () {
      run(
        () => CodeInterface.of(
          name: 'person',
          comment: 'hello world',
        ),
        '/**\n'
        ' * hello world\n'
        ' */\n'
        'interface Person {\n'
        '  \n'
        '}\n',
      );
    });

    test('with field', () {
      run(
        () => CodeInterface.of(
          name: 'person',
          fields: CodeFieldList([
            makeField('first name'),
          ]),
        ),
        'interface Person {\n'
        '  \n'
        '  \n'
        '  String firstName;\n'
        '  \n'
        '}\n',
      );
    });

    test('with field list', () {
      run(
        () => CodeClass.of(
          name: 'person',
          fields: CodeFieldList([
            makeField('first name'),
            makeField('last name'),
          ]),
        ),
        'class Person {\n'
        '  \n'
        '  \n'
        '  String firstName;\n'
        '  \n'
        '  String lastName;\n'
        '  \n'
        '}\n',
      );
    });

    test('with function list', () {
      run(
        () {
          return CodeClass.of(
            name: 'person',
            functions: CodeFunctionList([
              makeFunction('hello world 1'),
              makeFunction('hello world 2'),
            ]),
          );
        },
        'class Person {\n'
        '  \n'
        '  \n'
        '  /**\n'
        '   * test hello world 1\n'
        '   */\n'
        '  String helloWorld1(String name, Person other);\n'
        '  \n'
        '  /**\n'
        '   * test hello world 2\n'
        '   */\n'
        '  String helloWorld2(String name, Person other);\n'
        '  \n'
        '}\n',
      );
    });

    test('with all ', () {
      run(
        () {
          final generic = CodeGenericParamList([
            CodeGenericParam.simple('t'),
          ]);

          final extend = CodeClassExtendList([
            CodeClassExtend(CodeType(CodeTypeName.of('car'), generic: generic))
          ]);

          final implements = CodeClassImplementList([
            makeImplement('four wheel'),
            CodeClassImplement(CodeType(
              CodeTypeName.of('vehicle'),
              generic: generic,
            )),
          ]);

          final fields = CodeFieldList([
            makeField('first name'),
            makeField('last name'),
          ]);

          final functions = CodeFunctionList([
            makeFunction('hello world 1'),
            makeFunction('hello world 2'),
          ]);

          return CodeClass.of(
            name: 'person',
            access: CodeAccess.publicAbstract(),
            generic: generic,
            extend: extend,
            implements: implements,
            fields: fields,
            functions: functions,
          );
        },
        'public abstract class Person<T> extends Car<T> implements FourWheel, Vehicle<T> {\n'
        '  \n'
        '  \n'
        '  String firstName;\n'
        '  \n'
        '  String lastName;\n'
        '  \n'
        '  \n'
        '  /// test hello world 1\n'
        '  String helloWorld1(String name, Person other);\n'
        '  \n'
        '  /// test hello world 2\n'
        '  String helloWorld2(String name, Person other);\n'
        '  \n'
        '}\n',
      );
    });
  });
}
