import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_dart.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  group('java ', () {
    group('function arg', () {
      test('simple', () {
        var code = JavaCodeConfig(
          CodeArg.of(name: 'my car', type: 'car'),
        );
        runAndExpect(code, 'Car myCar');
      });

      test('with init', () {
        var code = JavaCodeConfig(
          CodeArg.of(name: 'name', type: 'String', init: 'john doe'),
        );
        runAndExpect(code, 'String name = "john doe"');
      });
    });

    group('function arg list', () {
      test('single', () {
        var code = JavaCodeConfig(
          CodeArgList.of(required: [
            ['my car', 'car'],
          ]),
        );
        runAndExpect(code, 'Car myCar');
      });
    });
  });

  group('dart', () {
    test('with this', () {
      runDart(
        CodeConstructor.of(
          requiredArgs: ['car'],
        ),
        '\n'
        'class Hello {\n'
        '  Hello(this.car);\n'
        '}\n',
      );
    });

    test('with init', () {
      runDart(
        CodeConstructor.of(
          requiredArgs: ['car'],
          init: [
            CodeFunctionCall.of(name: 'assert', args: [false]),
            CodeFunctionCall.of(name: 'assert', args: [true]),
          ],
        ),
        '\n'
        'class Hello {\n'
        '  Hello(this.car):\n'
        '      assert(false),\n'
        '      assert(true);\n'
        '}\n',
      );
    });
  });

  test('with body', () {
    runDart(
      CodeConstructor.of(
        requiredArgs: ['car'],
        init: [
          CodeFunctionCall.of(name: 'assert', args: [false]),
          'assert(car != null)'
        ],
        body: [
          CodeFunctionCall.of(name: 'print', args: ['hello world']),
        ],
      ),
      '\n'
      'class Hello {\n'
      '  Hello(this.car):\n'
      '      assert(false),\n'
      '      assert(car != null) {\n'
      '    print(\'hello world\');\n'
      '  }\n'
      '}\n',
    );
  });
}

void runDart(CodeConstructor constructor, String expected) {
  var code = DartCodeConfig(
    CodeClass.of(name: 'hello', constructors: [
      constructor,
    ]),
  );

  runAndExpect(code, expected);
}
