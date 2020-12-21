import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('null', () {
    oopRunAndExpect(
      CodeArgList.of(required: null),
      java: '',
    );
  });

  group('empty', () {
    oopRunAndExpect(
      CodeArgList.of(required: ''),
      java: '',
    );
  });

  group('string', () {
    oopRunAndExpect(
      CodeArgList.of(required: 'hello world'),
      java: 'helloWorld',
    );
  });

  group('node', () {
    oopRunAndExpect(
      CodeArgList.of(required: Text('hello world')),
      java: 'helloWorld',
    );
  });

  group('name of another name', () {
    var anotherName = CodeEnumValueName.of(name: 'hello world');
    oopRunAndExpect(anotherName, java: 'HELLO_WORLD');
    oopRunAndExpect(
      CodeArgList.of(required: anotherName),
      java: 'helloWorld',
    );
  });
}
