import 'package:g3m/g3techlab_core.dart';
import 'package:test/test.dart';

void main() {
  test('first', () {
    var node = ReadFile('./pubspec.yaml');
    final buf = StringBuffer();
    Program.execute(OutputRedirect(buf, node));
    final actual = buf.toString();
    expect(actual, contains('g3m'));
  });
}
