import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_dart.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('dart', () {
    group('property', () {
      test('simple', () {
        final code = propertySimple();
        runDart(
          code,
          '\n'
          'String firstName;\n',
        );
      });

      test('with init', () {
        var code = JavaCodeConfig(
          CodeProperty.of(
            name: 'first name',
            type: 'string',
            init: CodeStringLiteral.of('john'),
          ),
        );
        runDart(
          code,
          '\n'
          'String firstName = "john";\n',
        );
      });

      test('with init', () async {
        var code = JavaCodeConfig(
          CodeProperty.of(
            name: 'first name',
            type: 'string',
            private: true,
            static: true,
          ),
        );
        await runDart(
          code,
          '\n'
          'private static String firstName;\n',
        );
      });

      test('with comment', () {
        final code = propertyWithComment();
        runDart(
          code,
          '\n'
          '// hello world\n'
          'String firstName;\n',
        );
      });

      test('with body', () {
        final code = CodePropertyGetter.of(
          name: 'first name',
          type: 'string',
          body: [
            CodeReturn.of(Text.of('_firstName')),
          ],
        );
        runDart(
          code,
          '\n'
          'String get firstName {\n'
          '  return _firstName;\n'
          '}',
        );
      });
    });

    group('property list', () {
      test('with comment', () {
        final code = CodePropertyList.of([
          propertyWithComment(name: 'first name'),
          propertyWithComment(name: 'last name'),
        ]);
        runDart(
          code,
          '\n'
          '// hello world\n'
          'String firstName;\n'
          '\n'
          '// hello world\n'
          'String lastName;\n',
        );
      });
    });

    group('getter', () {
      test('name type only', () {
        final code = CodePropertyGetter.of(
          name: 'first name',
          type: 'string',
        );
        runDart(
          code,
          'String get firstName;\n',
        );
      });

      test('in a property', () {
        final code = CodeProperty.of(
          name: 'first name',
          type: 'string',
          private: true,
          getter: CodePropertyGetter.of(),
        );
        runDart(
          code,
          '\n'
          'String get _firstName;\n',
        );
      });
    });
  });

  group('setter', () {
    test('name type only', () {
      final code = CodePropertySetter.of(
        name: 'first name',
        type: 'string',
      );
      runDart(
        code,
        'set firstName(String value);\n',
      );
    });

    test('in a property', () {
      final code = CodeProperty.of(
        name: 'first name',
        type: 'string',
        private: true,
        setter: CodePropertySetter.of(),
      );
      runDart(
        code,
        '\n'
        'set _firstName(String value);\n',
      );
    });
  });
}

void runDart(Node node, String expected) {
  runAndExpect(DartCodeConfig(node), expected);
}

Node propertySimple({String name = 'first name'}) {
  return CodeProperty.of(
    name: name,
    type: 'string',
  );
}

Node propertyWithComment({String name = 'first name'}) {
  return CodeProperty.of(
    name: name,
    type: 'string',
    comment: 'hello world',
  );
}
