import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_java.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('empty', () {
    oopRunAndExpect(
      CodeEnumName.of(name: ''),
      java: '',
    );
  });

  group('string', () {
    oopRunAndExpect(
      CodeEnumName.of(name: 'hello world'),
      java: 'HelloWorld',
    );
  });

  group('node', () {
    oopRunAndExpect(
      CodeEnumName.of(name: Text('hello world')),
      java: 'HelloWorld',
    );
  });

  group('name of another name', () {
    // Runs with dart config
    oopRunAndExpect(
      CodeEnumName.of(
          name: CodeArgName.of(name: 'hello world'),
      ),
      java: 'HelloWorld',
    );
  });
}
