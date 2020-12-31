import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('simple', () {
    const s1 = 'for (Int i: entries) {\n'
        '\n'
        '}\n';

    const s2 = 'for (let i: Int of entries) {\n'
        '\n'
        '}\n';

    const s3 = 'for (int i: entries) {\n'
        '\n'
        '}\n';

    oopRunAndExpect(
      CodeForEach.of(
        item: CodeVar.of(name: 'i', type: 'int'),
        collection: Text('entries'),
        body: [],
      ),
      dart: s1,
      typescript: s2,
      java: s1,
      kotlin: s1,
    );
  });
}
