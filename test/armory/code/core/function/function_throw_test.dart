import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  group('function throw', () {
    test('simple', () {
      var code = JavaCodeConfig(
        CodeFunctionThrow.of(type: 'my car'),
      );
      runAndExpect(code, 'MyCar');
    });
  });

  group('function throw list', () {
    test('single', () {
      var code = JavaCodeConfig(
        CodeFunctionThrowList.of('my car'),
      );
      runAndExpect(code, ' throws MyCar');
    });

    test('list - empty', () {
      var code = JavaCodeConfig(
        CodeFunctionThrowList.of([]),
      );
      runAndExpect(code, '');
    });

    test('list - one', () {
      var code = JavaCodeConfig(
        CodeFunctionThrowList.of(['my car']),
      );
      runAndExpect(code, ' throws MyCar');
    });

    test('list - more than one', () {
      var code = JavaCodeConfig(
        CodeFunctionThrowList.of(['my car', 'my vehicle']),
      );
      runAndExpect(code, ' throws MyCar, MyVehicle');
    });
  });
}
