import 'package:g3m/g3gen.dart';
import 'package:test/test.dart';

void _run(CodeConfig config) {
  var doc = CodeDoc(config);
  doc
    ..package = 'com google'
    ..clazz('abc',
        abstract: true,
        protected: true,
        comment: 'Just class level comment', let: (clz) {
      clz
        ..field('abc', 'type', comment: 'Just a demo field')
        ..field('bcd', 'asdf');
    })
    ..clazz('abc', let: (clz) {
      // Adding field with shortcut.
      clz
        ..field('abc', 'String', comment: 'This is just a demo', private: true)
        ..field('abc', 'String', private: true)
        ..func('hello world func', comment: 'Just a function', let: (f) {
          f
            ..inArg('field1', 'string')
            ..inArg('field2', 'string')
            ..outArg('void')
            ..comment.write((w) {
              w + 'Hello, this is a much more complicated comment';
            })
            ..body.write((w) {
              w ^ 'var a = 5;';
              w ^ 'var a = 5;';
            });
        })
        ..clazz('another nested class', let: (clz) {
          clz
            ..field('nested field 1', 'String', comment: 'Just some comment')
            ..field('nested field 2', 'String')
            ..clazz('super nested class', let: (clz) {
              clz
                ..field('super nested field 1', 'String',
                    comment: 'Just some comment')
                ..field('super nested field 2', 'String');
            });
        });
    });

  print(doc.content);
}

void main() {
  test('dart', () {
    _run(CodeConfig.forDart());
  });

  test('java', () {
    _run(CodeConfig.forJava());
  });

  test('kotlin', () {
    _run(CodeConfig.forKotlin());
  });

  test('csharp', () {
    _run(CodeConfig.forCSharp());
  });

  test('python', () {
    _run(CodeConfig.forPython());
  });

  test('typescript', () {
    _run(CodeConfig.forTypescript());
  });

  test('proto3', () {
    _run(CodeConfig.forProto3());
  });

  test('go', () {
    _run(CodeConfig.forGo());
  });
}
