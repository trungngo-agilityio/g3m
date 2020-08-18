import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(Node node, String expected)  {
    var code = CodeModifierConfig.forJavaLike(node);
     runAndExpect(code, expected);
  }

  test('override', () {
    run(CodeModifier(override: true), '@override\n');
  });

  test('private', () {
    run(CodeModifier(private: true), 'private ');
  });

  test('public', () {
    run(CodeModifier(public: true), 'public ');
  });

  test('protected', () {
    run(CodeModifier(protected: true), 'protected ');
  });

  test('internal', () {
    run(CodeModifier(internal: true), 'internal ');
  });

  test('abstract', () {
    run(CodeModifier(abstract: true), 'abstract ');
  });

  test('static', () {
    run(CodeModifier(static: true), 'static ');
  });
  test('all', ()  {
     run(
      CodeModifier(
          override: true,
          private: true,
          public: true,
          protected: true,
          internal: true,
          abstract: true,
          static: true),
      '@override\n'
      'private public protected internal abstract static ',
    );
  });
}
