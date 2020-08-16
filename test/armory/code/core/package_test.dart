import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_dart.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('data type', () {
    test('simple', () {
      var code = JavaCodeConfig(
        CodePackage.of('my car'),
      );
      runAndExpect(code, 'package my_car;\n');
    });

    test('with path', () {
      var code = JavaCodeConfig(
        CodePackage.of('my car', path: ['g3']),
      );
      runAndExpect(code, 'package g3.my_car;\n');
    });

    test('part of', () {
      var code = DartCodeConfig(
        CodePackage.partOf('my car'),
      );
      runAndExpect(code, 'part of my_car;\n');
    });
  });
}
