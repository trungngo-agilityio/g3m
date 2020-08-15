import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('function arg', () {
    test('simple', () {
      var code = JavaCodeConfig(
        CodeFunctionArg.of('my car', type: 'car'),
      );
      runAndExpect(code, 'Car myCar');
    });

    test('with init', () {
      var code = JavaCodeConfig(
        CodeFunctionArg.of('name', type: 'String', init: 'john doe'),
      );
      runAndExpect(code, 'String name = "john doe"');
    });
  });

  group('function arg list', () {
    test('single', () {
      var code = JavaCodeConfig(
        CodeFunctionArgList.ofNameType('my car', 'car'),
      );
      runAndExpect(code, 'Car myCar');
    });

    test('list - empty', () {
      var code = JavaCodeConfig(
        CodeFunctionArgList.ofNameTypeMap({}),
      );
      runAndExpect(code, '');
    });

    test('list - one', () {
      var code = JavaCodeConfig(
        CodeFunctionArgList.ofNameTypeMap({
          'my car': 'car',
        }),
      );
      runAndExpect(code, 'Car myCar');
    });

    test('list - more than one', () {
      var code = JavaCodeConfig(
        CodeFunctionArgList.ofNameTypeMap({
          'my car': 'car',
          'my vehicle': 'vehicle',
        }),
      );
      runAndExpect(code, 'Car myCar, Vehicle myVehicle');
    });
  });
}
