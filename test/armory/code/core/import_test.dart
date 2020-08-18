import 'package:g3m/g3armory.dart';
import 'package:g3m/g3armory_dart.dart';
import 'package:g3m/g3armory_java.dart';
import 'package:test/test.dart';

import '../../utils.dart';

void main() {
  group('java', () {
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
      test('no type', ()  {
        var code = JavaCodeConfig(
          single,
        );

         runAndExpect(
          code,
          'import human.*;\n',
        );
      });

      test('multiple types', ()  {
        var code = JavaCodeConfig(
          multi,
        );

         runAndExpect(
          code,
          'import human.Vehicle;\n'
          'import human.Person;\n',
        );
      });
    });

    group('import list', () {
      test('all', ()  {
        var code = JavaCodeConfig(
          CodeImportList.of([single, multi]),
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
        CodeImport.allFromPath('hello_world.dart'),
      );

      runAndExpect(code, 'import \'hello_world.dart\';\n');
    });
  });
}
