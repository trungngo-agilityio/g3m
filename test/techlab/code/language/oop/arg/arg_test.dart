import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('java ', () {
    group('function arg', () {
      group('simple', () {
        oopRunAndExpect(
          CodeArg.of(name: 'my car', type: 'car'),
          java: 'Car myCar',
        );
      });

      group('with init', () {
        oopRunAndExpect(
          CodeArg.of(
            name: 'name',
            type: 'String',
            init: 'john doe',
          ),
          java: 'String name = "john doe"',
        );
      });
    });

    group('function arg list', () {
      group('single', () {
        oopRunAndExpect(
          CodeArgList.of(required: [
            ['my car', 'car'],
          ]),
          java: 'Car myCar',
        );
      });
    });
  });

  group('dart', () {
    group('with this', () {
      oopRunAndExpect(
        CodeClass.of(
          name: 'hello',
          constructors: CodeConstructor.of(
            requiredArgs: ['car'],
          ),
        ),
        dart: '\n'
            'class Hello {\n'
            '  Hello(this.car);\n'
            '}\n',
      );
    });

    group('with init', () {
      oopRunAndExpect(
        CodeClass.of(
          name: 'hello',
          constructors: CodeConstructor.of(
            requiredArgs: ['car'],
            init: [
              CodeFunctionCall.of(name: 'assert', args: [false]),
              CodeFunctionCall.of(name: 'assert', args: [true]),
            ],
          ),
        ),
        dart: '\n'
            'class Hello {\n'
            '  Hello(this.car):\n'
            '      assert(false),\n'
            '      assert(true);\n'
            '}\n',
      );
    });
  });

  group('with body', () {
    oopRunAndExpect(
      CodeClass.of(
        name: 'hello',
        constructors: CodeConstructor.of(
          requiredArgs: ['car'],
          init: [
            CodeFunctionCall.of(name: 'assert', args: [false]),
            'assert(car != null)'
          ],
          body: [
            CodeFunctionCall.of(name: 'print', args: ['hello world']),
          ],
        ),
      ),
      dart: '\n'
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
