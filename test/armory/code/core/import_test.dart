import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  final single = CodeImport.of(
    'human',
  );

  final multi = CodeImport.of(
    'human',
    types: [
      CodeImportType.of('vehicle'),
      CodeImportType.of('person'),
    ],
  );

  group('single import', () {
    test('no type', () async {
      var code = JavaCode(
        single,
      );

      await runAndExpect(
        code,
        'import human.*;\n',
      );
    });

    test('multiple types', () async {
      var code = JavaCode(
        multi,
      );

      await runAndExpect(
        code,
        'import human.Vehicle;\n'
        'import human.Person;\n',
      );
    });
  });
  group('import list', () {
    test('all', () async {
      var code = JavaCode(
        CodeImportList([single, multi]),
      );

      await runAndExpect(
        code,
        '\n'
        '\n'
        'import human.*;\n'
        'import human.Vehicle;\n'
        'import human.Person;\n',
      );
    });
  });
}
