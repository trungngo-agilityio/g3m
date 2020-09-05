import 'package:g3m/techlab_core.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test('empty', () {
    var root = Directory.temp(
      '~step1',
      Container([
        File.alwaysOverwrite('test1.text', Text.of('hello1')),
        Directory.temp(
          '~step2',
          File.alwaysOverwrite('test2.text', Text.of('hello2')),
        ),
      ]),
    );
    runAndExpect(root, '');
  });
}
