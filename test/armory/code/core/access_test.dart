import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(Node node, String expected) {
    var code = CodeAccessConfig.of(node);
    runAndExpect(code, expected);
  }

  test('private', () {
    run(CodeAccess.private(), 'private');
  });

  test('public', () {
    run(CodeAccess.public(), 'public');
  });

  test('internal', () {
    run(CodeAccess.internal(), 'internal');
  });

  test('public', () {
    run(CodeAccess.public(), 'public');
  });

  test('private abstract', () {
    run(CodeAccess.privateAbstract(), 'private abstract');
  });

  test('protected abstract', () {
    run(CodeAccess.protectedAbstract(), 'protected abstract');
  });

  test('internal abstract', () {
    run(CodeAccess.internalAbstract(), 'internal abstract');
  });

  test('public abstract', () {
    run(CodeAccess.publicAbstract(), 'public abstract');
  });

  test('private static', () {
    run(CodeAccess.privateStatic(), 'private static');
  });

  test('protected static', () {
    run(CodeAccess.protectedStatic(), 'protected static');
  });

  test('internal static', () {
    run(CodeAccess.internalStatic(), 'internal static');
  });

  test('public static', () {
    run(CodeAccess.publicStatic(), 'public static');
  });
}
