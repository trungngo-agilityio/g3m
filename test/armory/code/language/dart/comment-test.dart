import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../../../utils.dart';

void main() {
  group('comment', () {
    test('comment', () {
      var code = DartCode(
        CodeComment.text('hello world'),
      );
      runAndExpect(code, '/// hello world\n');
    });
  });
}
