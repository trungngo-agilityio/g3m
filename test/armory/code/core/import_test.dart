import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_dart.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('java', () {
    final single = CodeImport.of(
      package: 'human',
    );

    final multi = CodeImport.of(
      package: 'human',
      types: [
        CodeImportType.of(type: 'vehicle'),
        CodeImportType.of(type: 'person'),
      ],
    );

    group('single import', () {
      test('no type', () {
        var code = JavaCodeConfig(
          single,
        );

        runAndExpect(
          code,
          'import human.*',
        );
      });

      test('multiple types', () {
        var code = JavaCodeConfig(
          CodeStatement.of(multi),
        );

        runAndExpect(
          code,
          'import human.Vehicle;\n'
          'import human.Person;\n',
        );
      });
    });

    group('import list', () {
      test('all', () {
        var code = JavaCodeConfig(
          CodeStatement.of(
            CodeImportList.of([single, multi]),
          ),
        );

        runAndExpect(
          code,
          '\n'
          '\n'
          'import human.*;\n'
          'import human.Vehicle;\n'
          'import human.Person;\n',
        );
      });
    });
  });

  group('dart', () {
    test('import path', () {
      var code = DartCodeConfig(
        CodeImport.of(path: 'hello_world.dart'),
      );

      runAndExpect(code, 'import \'hello_world.dart\'');
    });
  });
}
