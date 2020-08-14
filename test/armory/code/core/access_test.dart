import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  void run(Node node, String expected) async {
    var code = CodeAccessConfig.forJavaLike(node);
    await runAndExpect(code, expected);
  }

  test('override', () {
    run(CodeAccess(override: true), '@override\n');
  });

  test('private', () {
    run(CodeAccess(private: true), 'private ');
  });

  test('public', () {
    run(CodeAccess(public: true), 'public ');
  });

  test('protected', () {
    run(CodeAccess(protected: true), 'protected ');
  });

  test('internal', () {
    run(CodeAccess(internal: true), 'internal ');
  });

  test('abstract', () {
    run(CodeAccess(abstract: true), 'abstract ');
  });

  test('static', () {
    run(CodeAccess(static: true), 'static ');
  });
  test('all', () async {
    await run(
      CodeAccess(
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
