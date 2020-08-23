import 'package:g3m/stimpack.dart';
import 'package:test/test.dart';

void main() {
  test('tmp', () {
    var p = PatternScope();
    var c = ConstraintScope(p);
    var t = DataTypeScope(c);
    var f = FieldScope(t, c);

    var t1 = t('int');
    var field1 = f('field1', t1);
    expect(field1.isValidSingle, isTrue);

    var field2 = field1 << 'LEFT';
    expect(field2.isValidSingle, isTrue);

    var field3 = field1 >> 'RIGHT';
    expect(field3.isValidSingle, isTrue);

    var fields = field1 + field2 + field3;
    expect(fields.isNonEmptyValidSet, isTrue);

    var t2 = t('string');
    fields.type = t2;

    print(fields.type);
    expect(field1.type, equals(t2));
    expect(field2.type, equals(t2));
    expect(field3.type, equals(t2));
  });

  test('all', () {
    var p = PatternScope();
    var c = ConstraintScope(p);
    var t = DataTypeScope(c);
    var f = FieldScope(t, c);

    // field1 is invalid because type is missing.
    var field1 = f('field1');
    expect(field1.isValidSingle, isFalse);

    // now type is filled, it is valid.
    field1.type = t('int');
    expect(field1.isValidSingle, isTrue);

    // constraint is optional. Add it in, still valid.
    field1.constraints = c('hello')..min = 5;
    print(field1.constraints);
    print(field1.constraints.isNonEmptyValidSet);
    expect(field1.isValidSingle, isTrue);

    // field2 is invalid, so, field1+field2 is also invalid.
    var field2 = f('field2');
    expect(field2.isValidSingle, isFalse);

    var fields = field1 + field2;
    expect(fields.isNonEmptyValidSet, isFalse);

    // fix field2, it is valid now. So field1+field2 is valid.
    field2.type = t('int');
    expect(field2.isValidSingle, isTrue);
    expect(fields.isNonEmptyValidSet, isTrue);

    // Adding some more fields in, those fields are just a copy of field 1.
    fields += (field1 ^ 'field3') + (field1 << 'field4') + (field1 >> 'field5');
    expect(fields.eval().length, equals(5));

    // Changes all fields to the new type.
    var string = t('string');
    fields.type = string;

    for (var e in fields.eval()) {
      expect(e.type, equals(string));
    }

    // Change field1+field2 with new constraint
    var required = c('required');
    var unique = c('unique');

    // Adds more than one constraint to more than one types.
    fields.constraints = required + unique;

    // Makes sure that all entries updated.
    for (var e in fields.eval()) {
      var all = (required + unique).eval();
      for (var ec in e.constraints.eval()) {
        all.contains(ec);
      }
    }
  });
}
