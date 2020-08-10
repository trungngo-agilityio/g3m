import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('function throw', () {
    test('simple', () {
      var code = DartCode(
        CodeFunctionThrow.simple('my car'),
      );
      runAndExpect(code, 'MyCar');
    });
  });

  group('function throw list', () {
    test('single', () {
      var code = DartCode(
        CodeFunctionThrowList.single('my car'),
      );
      runAndExpect(code, 'MyCar');
    });

    test('list - empty', () {
      var code = DartCode(
        CodeFunctionThrowList.list([]),
      );
      runAndExpect(code, '');
    });

    test('list - one', () {
      var code = DartCode(
        CodeFunctionThrowList.list(['my car']),
      );
      runAndExpect(code, 'MyCar');
    });

    test('list - more than one', () {
      var code = DartCode(
        CodeFunctionThrowList.list(['my car', 'my vehicle']),
      );
      runAndExpect(code, 'MyCar, MyVehicle');
    });
  });
}
