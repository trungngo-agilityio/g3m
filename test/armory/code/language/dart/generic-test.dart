import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  group('generic param', () {
    test('generic param', () {
      var code = DartCode(
        CodeGenericParam(Text('hello world')),
      );
      runAndExpect(code, 'HelloWorld');
    });

    test('generic param extends', () {
      var code = DartCode(
        CodeGenericParam(
          Text('car'),
          extend: CodeDataType(Text('vehicle')),
        ),
      );
      runAndExpect(code, 'Car extends Vehicle');
    });
  });
}
