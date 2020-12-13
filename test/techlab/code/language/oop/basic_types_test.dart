import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  test('Single', () {
    oopRunAndExpect(
      CodeType.ofDynamic(),
      dart: 'dynamic',
      typescript: 'any',
      java: 'object',
      kotlin: 'Any',
    );
    oopRunAndExpect(
      CodeType.ofVoid(),
      dart: 'void',
      typescript: 'void',
      java: 'void',
      kotlin: 'void',
    );
    oopRunAndExpect(
      CodeType.ofBool(),
      dart: 'bool',
      typescript: 'boolean',
      java: 'boolean',
      kotlin: 'Boolean',
    );
    oopRunAndExpect(
      CodeType.ofChar(),
      dart: 'string',
      typescript: 'string',
      java: 'char',
      kotlin: 'Char',
    );
    oopRunAndExpect(
      CodeType.ofString(),
      dart: 'string',
      typescript: 'string',
      java: 'String',
      kotlin: 'String',
    );
    oopRunAndExpect(
      CodeType.ofByte(),
      dart: 'int',
      typescript: 'number',
      java: 'byte',
      kotlin: 'Byte',
    );
    oopRunAndExpect(
      CodeType.ofShort(),
      dart: 'int',
      typescript: 'number',
      java: 'short',
      kotlin: 'Short',
    );
    oopRunAndExpect(
      CodeType.ofInteger(),
      dart: 'int',
      typescript: 'number',
      java: 'int',
      kotlin: 'Int',
    );
    oopRunAndExpect(
      CodeType.ofLong(),
      dart: 'int',
      typescript: 'number',
      java: 'long',
      kotlin: 'Long',
    );
    oopRunAndExpect(
      CodeType.ofFloat(),
      dart: 'double',
      typescript: 'number',
      java: 'float',
      kotlin: 'Float',
    );
    oopRunAndExpect(
      CodeType.ofDouble(),
      dart: 'double',
      typescript: 'number',
      java: 'double',
      kotlin: 'Double',
    );
  });

  test('Array', () {
    oopRunAndExpect(
      CodeType.ofDynamicArray(),
      dart: 'List<dynamic>',
      typescript: 'any[]',
      java: 'object[]',
      kotlin: 'Array<Any>',
    );
    oopRunAndExpect(
      CodeType.ofBoolArray(),
      dart: 'List<bool>',
      typescript: 'boolean[]',
      java: 'boolean[]',
      kotlin: 'Array<Boolean>',
    );
    oopRunAndExpect(
      CodeType.ofCharArray(),
      dart: 'List<String>',
      typescript: 'string[]',
      java: 'char[]',
      kotlin: 'Array<Char>',
    );
    oopRunAndExpect(
      CodeType.ofStringArray(),
      dart: 'List<String>',
      typescript: 'string[]',
      java: 'String[]',
      kotlin: 'Array<String>',
    );
    oopRunAndExpect(
      CodeType.ofByteArray(),
      dart: 'List<int>',
      typescript: 'number[]',
      java: 'byte[]',
      kotlin: 'Array<Byte>',
    );
    oopRunAndExpect(
      CodeType.ofShortArray(),
      dart: 'List<int>',
      typescript: 'number[]',
      java: 'short[]',
      kotlin: 'Array<Short>',
    );
    oopRunAndExpect(
      CodeType.ofIntegerArray(),
      dart: 'List<int>',
      typescript: 'number[]',
      java: 'int[]',
      kotlin: 'Array<Int>',
    );
    oopRunAndExpect(
      CodeType.ofLongArray(),
      dart: 'List<int>',
      typescript: 'number[]',
      java: 'long[]',
      kotlin: 'Array<Long>',
    );
    oopRunAndExpect(
      CodeType.ofFloatArray(),
      dart: 'List<double>',
      typescript: 'number[]',
      java: 'float[]',
      kotlin: 'Array<Float>',
    );
    oopRunAndExpect(
      CodeType.ofDoubleArray(),
      dart: 'List<double>',
      typescript: 'number[]',
      java: 'double[]',
      kotlin: 'Array<Double>',
    );
  });

  test('List', () {
    oopRunAndExpect(
      CodeType.ofDynamicList(),
      dart: 'List<dynamic>',
      typescript: 'List<any>',
      java: 'List<object>',
      kotlin: 'List<Any>',
    );
    oopRunAndExpect(
      CodeType.ofBoolList(),
      dart: 'List<bool>',
      typescript: 'List<boolean>',
      java: 'List<boolean>',
      kotlin: 'List<Boolean>',
    );
    oopRunAndExpect(
      CodeType.ofCharList(),
      dart: 'List<String>',
      typescript: 'List<string>',
      java: 'List<char>',
      kotlin: 'List<Char>',
    );
    oopRunAndExpect(
      CodeType.ofStringList(),
      dart: 'List<String>',
      typescript: 'List<string>',
      java: 'List<String>',
      kotlin: 'List<String>',
    );
    oopRunAndExpect(
      CodeType.ofByteList(),
      dart: 'List<int>',
      typescript: 'List<number>',
      java: 'List<byte>',
      kotlin: 'List<Byte>',
    );
    oopRunAndExpect(
      CodeType.ofShortList(),
      dart: 'List<int>',
      typescript: 'List<number>',
      java: 'List<short>',
      kotlin: 'List<Short>',
    );
    oopRunAndExpect(
      CodeType.ofIntegerList(),
      dart: 'List<int>',
      typescript: 'List<number>',
      java: 'List<int>',
      kotlin: 'List<Int>',
    );
    oopRunAndExpect(
      CodeType.ofLongList(),
      dart: 'List<int>',
      typescript: 'List<number>',
      java: 'List<long>',
      kotlin: 'List<Long>',
    );
    oopRunAndExpect(
      CodeType.ofFloatList(),
      dart: 'List<double>',
      typescript: 'List<number>',
      java: 'List<float>',
      kotlin: 'List<Float>',
    );
    oopRunAndExpect(
      CodeType.ofDoubleList(),
      dart: 'List<double>',
      typescript: 'List<number>',
      java: 'List<double>',
      kotlin: 'List<Double>',
    );
  });
}
