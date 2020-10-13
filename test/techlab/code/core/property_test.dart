import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_dart.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('dart', () {
    test('simple', () {
      var code = CodeProperty.of(
        name: 'first name',
        type: 'string',
        isPrivate: true,
        isOverride: true,
        getter: CodePropertyGetter.of(
          body: CodeReturn.of(true),
        ),
      );
      runDart(
        code,
        '\n'
        '@override\n'
        'String get _firstName {\n'
        '  return true;\n'
        '}',
      );
    });

    test('with comment', () {
      final code = propertyWithComment();
      runDart(
        code,
        '\n'
        'String get firstName {\n'
        '  return true;\n'
        '}\n'
        '\n'
        'set firstName(String value) {\n'
        '  hello();\n'
        '}',
      );
    });

    test('with body', () {
      final code = CodeProperty.of(
        name: 'first name',
        type: 'string',
        getter: CodePropertyGetter.of(
          body: CodeReturn.of(Text('_firstName')),
        ),
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
          'String get firstName {\n'
          '  return true;\n'
          '}\n'
          '\n'
          'set firstName(String value) {\n'
          '  hello();\n'
          '}\n'
          'String get lastName {\n'
          '  return true;\n'
          '}\n'
          '\n'
          'set lastName(String value) {\n'
          '  hello();\n'
          '}');
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
    getter: CodeReturn.of(true),
    setter: CodeFunctionCall.of(name: 'hello'),
  );
}
