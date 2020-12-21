import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('empty', () {
    oopRunAndExpect(
      CodeArgName.of(name: ''),
      java: '',
    );
  });

  group('string', () {
    oopRunAndExpect(
      CodeArgName.of(name: 'hello world'),
      java: 'helloWorld',
    );
  });

  group('node', () {
    oopRunAndExpect(
      CodeArgName.of(name: Text('hello world')),
      java: 'helloWorld',
    );
  });

  group('name of another name', () {
    var anotherName = CodeEnumValueName.of(name: 'hello world');
    oopRunAndExpect(anotherName, java: 'HELLO_WORLD');
    oopRunAndExpect(
      CodeArgName.of(name: anotherName),
      java: 'helloWorld',
    );
  });

  group('with java private final', () {
    oopRunAndExpect(
      CodeArgName.of(
        name: 'hello',
        isPrivate: true,
      ),
      java: 'hello',
    );
  });

  group('with dart private final', () {
    const s1 = '_hello';
    const s2 = 'hello';
    oopRunAndExpect(
      CodeArgName.of(
        name: 'hello',
        isPrivate: true,
      ),
      dart: s1,
      typescript: s2,
      java: s2,
      kotlin: s2,
    );
  });
}
