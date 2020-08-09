import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  group('function arg', () {
    test('simple', () {
      var code = DartCode(
        CodeFunctionArg.ofNameType('my car', 'car'),
      );
      runAndExpect(code, 'Car myCar');
    });
  });

  group('function arg list', () {
    test('single', () {
      var code = DartCode(
        CodeFunctionArgList.ofNameType('my car', 'car'),
      );
      runAndExpect(code, 'Car myCar');
    });

    test('list - empty', () {
      var code = DartCode(
        CodeFunctionArgList.ofNameTypeMap({}),
      );
      runAndExpect(code, '');
    });

    test('list - one', () {
      var code = DartCode(
        CodeFunctionArgList.ofNameTypeMap({
          'my car': 'car',
        }),
      );
      runAndExpect(code, 'Car myCar');
    });

    test('list - more than one', () {
      var code = DartCode(
        CodeFunctionArgList.ofNameTypeMap({
          'my car': 'car',
          'my vehicle': 'vehicle',
        }),
      );
      runAndExpect(code, 'Car myCar, Vehicle myVehicle');
    });
  });
}
