import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('data type', () {
    test('simple', () {
      var code = JavaCodeConfig(
        CodeType.of(name: 'my car'),
      );
      runAndExpect(code, 'MyCar');
    });

    test('array', () {
      var code = JavaCodeConfig(
        CodeType.array('car'),
      );
      runAndExpect(code, 'Car[]');
    });

    test('generic', () {
      var code = JavaCodeConfig(
        CodeType.genericSingle('list', 'car'),
      );
      runAndExpect(code, 'List<Car>');
    });

    test('generic array', () {
      var code = JavaCodeConfig(
        CodeType.genericSingleArray('Vehicle', 'car'),
      );
      runAndExpect(code, 'Vehicle<Car>[]');
    });
  });
}
