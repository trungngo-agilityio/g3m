import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(Node node, String expected) {
    var code = CodeModifierConfig.forJavaLike(node);
    runAndExpect(code, expected);
  }

  test('override', () {
    run(CodeModifier(isOverride: true), '');
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
    run(CodeModifier(isInternal: true), '');
  });

  test('abstract', () {
    run(CodeModifier(isAbstract: true), 'abstract ');
  });

  test('static', () {
    run(CodeModifier(isStatic: true), 'static ');
  });
  test('all', () {
    run(
      CodeModifier(
          isOverride: true,
          isPrivate: true,
          isPublic: true,
          isProtected: true,
          isInternal: true,
          isAbstract: true,
          isStatic: true),
      'private public protected abstract static ',
    );
  });
}
