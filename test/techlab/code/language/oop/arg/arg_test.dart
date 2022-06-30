import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('arg_test', () {
    group('simple', () {
      const s1 = 'Car myCar';
      const s2 = 'myCar: Car';

      oopRunAndExpect(
        CodeArg.of(
          name: 'my car',
          type: 'car',
        ),
        dart: s1,
        typescript: s2,
        java: s1,
        kotlin: s2,
      );
    });

    group('with init', () {
      oopRunAndExpect(
        CodeArg.of(
          name: 'name',
          type: 'String',
          init: 'john doe',
        ),
        dart: 'String name = \'john doe\'',
        typescript: 'name: string = \'john doe\'',
        java: 'String name = "john doe"',
        kotlin: 'name: String = "john doe"',
      );
    });

    group('with annotation', () {
      const s1 = '\n  Car myCar,\n  @required @nonNull() Car another';
      const s2 = '\n  myCar: Car,\n  @required @nonNull() another: Car';
      const s3 = '\n    Car myCar,\n    @required @nonNull() Car another';

      oopRunAndExpect(
        CodeArgList.of(required: [
          ['my car', 'car'],
          CodeArg.of(
            name: 'another',
            type: 'car',
            annotations: [
              'required',
              CodeAnnotation.functionCall(name: 'non null'),
            ],
          ),
        ]),
        dart: s1,
        typescript: s2,
        java: s3,
        kotlin: s2,
      );
    });
  });
}
