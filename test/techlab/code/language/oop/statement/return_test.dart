import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('simple', () {
    const s1 = 'return true';
    oopRunAndExpect(
      CodeReturn.of(true),
      dart: s1,
      typescript: s1,
      java: s1,
      kotlin: s1,
    );
  });
}