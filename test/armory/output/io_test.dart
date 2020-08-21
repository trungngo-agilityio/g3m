import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  test('empty', () {
    var root = Directory.temp(
      '~step1',
      Container([
        File('test1.text', Text.of('hello1')),
        Directory.temp(
          '~step2',
          File('test2.text', Text.of('hello2')),
        ),
      ]),
    );
    runAndExpect(root, '');
  });
}
