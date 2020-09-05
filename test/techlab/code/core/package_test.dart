import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_dart.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('data type', () {
    test('simple', () {
      var code = JavaCodeConfig(
        CodePackage.of('my car'),
      );
      runAndExpect(code, '\npackage my_car');
    });

    test('with path', () {
      var code = JavaCodeConfig(
        CodePackage.of('my car', path: ['g3']),
      );
      runAndExpect(code, '\npackage g3.my_car');
    });

    test('part of', () {
      var code = DartCodeConfig(
        CodePackage.partOf('my car'),
      );
      runAndExpect(code, '\npart of my_car');
    });
  });
}
