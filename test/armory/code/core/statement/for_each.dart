import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  test('simple', () async {
    var code = JavaCodeConfig(
      CodeForEach.of(
        item: CodeVar.of('i', type: 'int'),
        collection: Text.of('entries'),
        body: ['print("Hello World!")'],
      ),
    );

    await runAndExpect(
      code,
      'for (int i: entries) {\n'
      '  print("Hello World!");\n'
      '}\n',
    );
  });
}
