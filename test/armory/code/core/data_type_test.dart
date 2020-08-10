import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('data type', () {
    test('simple', () {
      var code = DartCode(
        CodeDataType.simple('my car'),
      );
      runAndExpect(code, 'MyCar');
    });

    test('array', () {
      var code = DartCode(
        CodeDataType.array('car'),
      );
      runAndExpect(code, 'List<Car>');
    });

    test('generic', () {
      var code = DartCode(
        CodeDataType.genericSingle('list', 'car'),
      );
      runAndExpect(code, 'List<Car>');
    });

    test('generic array', () {
      var code = DartCode(
        CodeDataType.genericSingleArray('Vehicle', 'car'),
      );
      runAndExpect(code, 'List<Vehicle<Car>>');
    });
  });
}
