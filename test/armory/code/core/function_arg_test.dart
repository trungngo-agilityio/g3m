import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('function arg', () {
    test('simple', () {
      var code = JavaCode(
        CodeFunctionArg.of('my car', type: 'car'),
      );
      runAndExpect(code, 'Car myCar');
    });

    test('with init', () {
      var code = JavaCode(
        CodeFunctionArg.of('name', type: 'String', init: 'john doe'),
      );
      runAndExpect(code, 'String name = "john doe"');
    });
  });

  group('function arg list', () {
    test('single', () {
      var code = JavaCode(
        CodeFunctionArgList.ofNameType('my car', 'car'),
      );
      runAndExpect(code, 'Car myCar');
    });

    test('list - empty', () {
      var code = JavaCode(
        CodeFunctionArgList.ofNameTypeMap({}),
      );
      runAndExpect(code, '');
    });

    test('list - one', () {
      var code = JavaCode(
        CodeFunctionArgList.ofNameTypeMap({
          'my car': 'car',
        }),
      );
      runAndExpect(code, 'Car myCar');
    });

    test('list - more than one', () {
      var code = JavaCode(
        CodeFunctionArgList.ofNameTypeMap({
          'my car': 'car',
          'my vehicle': 'vehicle',
        }),
      );
      runAndExpect(code, 'Car myCar, Vehicle myVehicle');
    });
  });
}
