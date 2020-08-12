import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('data type', () {
    test('simple', () {
      var code = DartCode(
        CodeType.simple('my car'),
      );
      runAndExpect(code, 'MyCar');
    });

    test('array', () {
      var code = DartCode(
        CodeType.array('car'),
      );
      runAndExpect(code, 'List<Car>');
    });

    test('generic', () {
      var code = DartCode(
        CodeType.genericSingle('list', CodeGenericParam.of('car')),
      );
      runAndExpect(code, 'List<Car>');
    });

    test('generic array', () {
      var code = DartCode(
        CodeType.genericSingleArray('Vehicle', 'car'),
      );
      runAndExpect(code, 'List<Vehicle<Car>>');
    });
  });
}
