import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('comment', () {
    test('comment', () {
      var code = DartCode(
        CodeComment.text('hello world'),
      );
      runAndExpect(code, '/// hello world\n');
    });
  });

  group('data type', () {
    test('simple', () {
      var code = DartCode(
        CodeDataType.simple(Text('hello world')),
      );
      runAndExpect(code, 'HelloWorld');
    });

    test('array', () {
      var code = DartCode(
        CodeDataType.array(Text('car')),
      );
      runAndExpect(code, 'List<Car>');
    });

    test('generic', () {
      var code = DartCode(
        CodeDataType.generic(
          Text('list'),
          CodeGenericParamList([
            CodeGenericParam(Text('car')),
          ]),
        ),
      );
      runAndExpect(code, 'List<Car>');
    });

    test('generic array', () {
      var code = DartCode(
        CodeDataType.genericArray(
          Text('Vehicle'),
          CodeGenericParamList([
            CodeGenericParam(Text('car')),
          ]),
        ),
      );
      runAndExpect(code, 'List<Vehicle<Car>>');
    });
  });

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
