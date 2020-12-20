import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('List', () {
    oopRunAndExpect(
      CodeType.listOfDynamic(),
      dart: 'List<dynamic>',
      typescript: 'List<any>',
      java: 'List<object>',
      kotlin: 'List<Any>',
    );
    oopRunAndExpect(
      CodeType.listOfBool(),
      dart: 'List<bool>',
      typescript: 'List<boolean>',
      java: 'List<boolean>',
      kotlin: 'List<Boolean>',
    );
    oopRunAndExpect(
      CodeType.listOfChar(),
      dart: 'List<String>',
      typescript: 'List<string>',
      java: 'List<char>',
      kotlin: 'List<Char>',
    );
    oopRunAndExpect(
      CodeType.listOfString(),
      dart: 'List<String>',
      typescript: 'List<string>',
      java: 'List<String>',
      kotlin: 'List<String>',
    );
    oopRunAndExpect(
      CodeType.listOfByte(),
      dart: 'List<int>',
      typescript: 'List<number>',
      java: 'List<byte>',
      kotlin: 'List<Byte>',
    );
    oopRunAndExpect(
      CodeType.listOfShort(),
      dart: 'List<int>',
      typescript: 'List<number>',
      java: 'List<short>',
      kotlin: 'List<Short>',
    );
    oopRunAndExpect(
      CodeType.listOfInteger(),
      dart: 'List<int>',
      typescript: 'List<number>',
      java: 'List<int>',
      kotlin: 'List<Int>',
    );
    oopRunAndExpect(
      CodeType.listOfLong(),
      dart: 'List<int>',
      typescript: 'List<number>',
      java: 'List<long>',
      kotlin: 'List<Long>',
    );
    oopRunAndExpect(
      CodeType.listOfFloat(),
      dart: 'List<double>',
      typescript: 'List<number>',
      java: 'List<float>',
      kotlin: 'List<Float>',
    );
    oopRunAndExpect(
      CodeType.listOfDouble(),
      dart: 'List<double>',
      typescript: 'List<number>',
      java: 'List<double>',
      kotlin: 'List<Double>',
    );
  });
}
