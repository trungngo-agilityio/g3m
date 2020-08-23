import 'package:g3m/stimpack.dart';
import 'package:test/test.dart';

void main() {
  test('constraint - min', () {
    var pattern = PatternScope();
    var constraint = ConstraintScope(pattern);

    // Makes sure null min by default
    var nil = constraint('nil');
    expect(nil.min, isNull);

    // Creates to min constraints
    var min5 = constraint('min-5')..min = 5;
    expect(min5.min, equals(5));

    var min10 = constraint('min-10')..min = 10;
    expect(min10.min, equals(10));

    final added = (min5 + min10).eval();

    expect(added.length, equals(2));
  });
}
