import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_dart.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  group('function return', () {
    test('simple', () {
      var code = JavaCodeConfig(
        CodeFunctionReturn.of(type: 'my car'),
      );
      runAndExpect(code, 'MyCar');
    });
  });

  group('function return list', () {
    test('single', () {
      var code = JavaCodeConfig(
        CodeFunctionReturnList.of('my car'),
      );
      runAndExpect(code, 'MyCar');
    });

    test('list - empty', () {
      var code = JavaCodeConfig(
        CodeFunctionReturnList.of([]),
      );
      runAndExpect(code, '');
    });

    test('list - one', () {
      var code = JavaCodeConfig(
        CodeFunctionReturnList.of(['my car']),
      );
      runAndExpect(code, 'MyCar');
    });

    test('list - more than one', () {
      var code = JavaCodeConfig(
        CodeFunctionReturnList.of(['my car', 'my vehicle']),
      );
      runAndExpect(code, 'MyCar, MyVehicle');
    });
  });

  group('stream & async', () {
    test('async', () {
      var code = DartCodeConfig(
        CodeFunctionReturn.of(type: 'my car', isAsync: true),
      );
      runAndExpect(code, 'MyCar async');
    });

    test('stream', () {
      var code = DartCodeConfig(
        CodeFunctionReturn.of(type: 'my car', isStream: true),
      );
      runAndExpect(code, 'MyCar sync*');
    });

    test('async stream', () {
      var code = DartCodeConfig(
        CodeFunctionReturn.of(type: 'my car', isAsync: true, isStream: true),
      );
      runAndExpect(code, 'MyCar async*');
    });
  });
}
