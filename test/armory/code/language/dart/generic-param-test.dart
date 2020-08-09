import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  group('param', () {
    test('simple', () {
      var code = DartCode(
        CodeGenericParam.simple('my car'),
      );
      runAndExpect(code, 'MyCar');
    });
  });

  group('param list', () {
    test('single', () {
      var code = DartCode(
        CodeGenericParamList.single('my car'),
      );
      runAndExpect(code, 'MyCar');
    });

    test('list - empty', () {
      var code = DartCode(
        CodeGenericParamList.list([]),
      );
      runAndExpect(code, '');
    });

    test('list - one', () {
      var code = DartCode(
        CodeGenericParamList.list(['my car']),
      );
      runAndExpect(code, 'MyCar');
    });

    test('list - more than one', () {
      var code = DartCode(
        CodeGenericParamList.list(['my car', 'my vehicle']),
      );
      runAndExpect(code, 'MyCar, MyVehicle');
    });
  });
}
