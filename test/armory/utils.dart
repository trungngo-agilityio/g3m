import 'package:g3m/g3armory.dart';
import 'package:test/test.dart';

void runAndExpect(Node node, String expected) async {
  final buf = StringBuffer();
  await Program.execute(OutputRedirect(buf, node));
  final actual = buf.toString();
  expect(actual, expected);
}
