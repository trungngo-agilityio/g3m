import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(Node node, String expected) {
    var code = CodeModifierConfig.forJavaLike(node);
    runAndExpect(code, expected);
  }

  test('override', () {
    run(CodeModifier(override: true), '');
  });

  test('private', () {
    run(CodeModifier(isPrivate: true), 'private ');
  });

  test('public', () {
    run(CodeModifier(isPublic: true), 'public ');
  });

  test('protected', () {
    run(CodeModifier(isProtected: true), 'protected ');
  });

  test('internal', () {
    run(CodeModifier(isInternal: true), 'internal ');
  });

  test('abstract', () {
    run(CodeModifier(abstract: true), 'abstract ');
  });

  test('static', () {
    run(CodeModifier(static: true), 'static ');
  });
  test('all', () {
    run(
      CodeModifier(
          override: true,
          isPrivate: true,
          isPublic: true,
          isProtected: true,
          isInternal: true,
          abstract: true,
          static: true),
      'private public protected internal abstract static ',
    );
  });
}
