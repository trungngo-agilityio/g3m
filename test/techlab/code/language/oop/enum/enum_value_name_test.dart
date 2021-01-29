import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('empty', () {
    oopRunAndExpect(
      CodeEnumValueName.of(name: ''),
      java: '',
    );
  });

  group('string', () {
    oopRunAndExpect(
      CodeEnumValueName.of(name: 'hello world'),
      java: 'HELLO_WORLD',
    );
  });

  group('node', () {
    oopRunAndExpect(
      CodeEnumValueName.of(name: Text('hello world')),
      java: 'HELLO_WORLD',
    );
  });

  group('name of another name', () {
    // Runs with dart config
    oopRunAndExpect(
      CodeArgName.of(name: 'hello world'),
      java: 'helloWorld',
    );
  });
}
