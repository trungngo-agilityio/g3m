import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('data type', () {
    test('simple', () {
      var code = JavaCodeConfig(
        CodePackage.of('my car'),
      );
      runAndExpect(code, 'package myCar;');
    });
  });
}
