import 'package:g3m/g3m.dart';
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

    // Makes a composite min constraints.
    // So the new constraint should have min 10 to make it satisfies
    // both min 5 and min 10.
    var m1 = min5 + min10;
    expect(m1.eval().first.min, equals(10));

    // Makes a another composite constraints of min-10 and min-15,
    // the new one should be min 15.
    var m2 = m1 + constraint(null)
      ..min = 15;
    expect(m2.min, equals(15));

    // Change the lower min of a composite will not change it sub constraint
    m1.min = 0;
    expect(min5.min, equals(15));

    // Changes the higher min of a composite will change it sub constraint
    m1.min = 20;
    expect(min5.min, equals(20));
  });

  test('constraint - max', () {
    var pattern = PatternScope();
    var constraint = ConstraintScope(pattern);

    // Makes sure null min by default
    var nil = constraint('nil');
    expect(nil.max, isNull);

    // Creates to min constraints
    var max5 = constraint('max-5')..max = 5;
    expect(max5.max, equals(5));

    var max10 = constraint('max-10')..max = 10;
    expect(max10.max, equals(10));

    // Makes a composite max constraints.
    // So the new constraint should have max 5 to make it satisfies
    // both max 5 and max 10.
    var m1 = max5 + max10;
    expect(m1.eval().single.max, equals(5));

    // Makes a another composite constraints of min-10 and min-15,
    // the new one should be min 15.
    var m2 = m1 + constraint(null)
      ..max = 2;
    expect(m2.max, equals(2));

    // Sets lower max for a composite will change the sub constraint
    m1.max = 0;
    expect(max5.max, equals(0));

    // Sets higher max for a composite will not change sub constraint
    m1.max = 20;
    expect(max5.max, equals(0));
  });

  test('constraint - required', () {
    var pattern = PatternScope();
    var constraint = ConstraintScope(pattern);

    var a = constraint('a')..required = true;
    var b = constraint('b')..required = false;
    var c = constraint('c');

    expect(c.required, isNull);
    expect((a + b).required, equals(true));
    expect((a + c).required, equals(true));
    expect((b + c).required, equals(false));
  });

  test('constraint - unique', () {
    var pattern = PatternScope();
    var constraint = ConstraintScope(pattern);

    var a = constraint('a')..unique = true;
    var b = constraint('b')..unique = false;
    var c = constraint('c');

    expect(c.unique, isFalse);

    expect((a + b).unique, equals(true));
    expect((a + c).unique, equals(true));
    expect((b + c).unique, equals(false));
  });
}
