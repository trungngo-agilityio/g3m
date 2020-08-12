import 'package:g3m/g3m.dart';
import 'package:test/test.dart';

void main() {
  test('to collection', () {
    var p = PatternScope();
    var c = ConstraintScope(p);
    var t = DataTypeScope(c);

    expect(t('int').asArray().name.toString(), 'array of int');
    expect(t('int').asMutableArray().name.toString(), 'mutable array of int');

    expect(t('int').asList().name.toString(), 'list of int');
    expect(t('int').asMutableList().name.toString(), 'mutable list of int');

    expect(t('int').asSet().name.toString(), 'set of int');
    expect(t('int').asMutableSet().name.toString(), 'mutable set of int');
  });

  test('model to collection', () {
    var p = PatternScope();
    var c = ConstraintScope(p);
    var t = DataTypeScope(c);
    var f = FieldScope(t, c);
    var m = ModelScope(f);

    var int = t('int');
    var id = f('id', int);
    var user = m('user', fields: id);

    expect(user.asDataType().name.toString(), 'user');
    expect(user.asDataType().asArray().name.toString(), 'array of user');
    expect(user.asDataType().asMutableArray().name.toString(),
        'mutable array of user');

    expect(user.asDataType().asList().name.toString(), 'list of user');
    expect(user.asDataType().asMutableList().name.toString(),
        'mutable list of user');

    expect(user.asDataType().asSet().name.toString(), 'set of user');
    expect(user.asDataType().asMutableSet().name.toString(),
        'mutable set of user');
  });
}
