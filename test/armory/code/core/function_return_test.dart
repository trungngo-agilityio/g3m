import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('function return', () {
    test('simple', () {
      var code = JavaCodeConfig(
        CodeFunctionReturn.simple('my car'),
      );
      runAndExpect(code, 'MyCar');
    });
  });

  group('function return list', () {
    test('single', () {
      var code = JavaCodeConfig(
        CodeFunctionReturnList.single('my car'),
      );
      runAndExpect(code, 'MyCar');
    });

    test('list - empty', () {
      var code = JavaCodeConfig(
        CodeFunctionReturnList.list([]),
      );
      runAndExpect(code, '');
    });

    test('list - one', () {
      var code = JavaCodeConfig(
        CodeFunctionReturnList.list(['my car']),
      );
      runAndExpect(code, 'MyCar');
    });

    test('list - more than one', () {
      var code = JavaCodeConfig(
        CodeFunctionReturnList.list(['my car', 'my vehicle']),
      );
      runAndExpect(code, 'MyCar, MyVehicle');
    });
  });
}
