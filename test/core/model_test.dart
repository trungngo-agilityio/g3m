import 'package:g3m/stimpack.dart';
import 'package:test/test.dart';

void main() {
  test('all', () {
    var p = PatternScope();
    var c = ConstraintScope(p);
    var t = DataTypeScope(c);
    var f = FieldScope(t, c);
    var m = ModelScope(f);

    // a is invalid because field is missing.
    var a = m('a');
    expect(a.isValidSingle, isFalse);

    // Adds in a name field, this is still invalid because the field
    // has no type.
    var name = f('name');
    a.fields = name;
    expect(a.isValidSingle, isFalse);

    // Now, fix the field type, the model become valid.
    name.type = t('int');
    expect(a.isValidSingle, isTrue);

    // Adds another field, desc
    a.fields += name ^ 'desc';
    expect(a.isValidSingle, isTrue);
  });
}
