import 'package:g3m/g3mex.dart';
import 'package:test/test.dart';

void main() {
  test('all', () {
    var p = PatternScopeEx();
    var c = ConstraintScopeEx(p);
    var t = DataTypeScopeEx(c);
    var f = FieldScopeEx(t, c);
    var m = ModelScopeEx(f);

    expect(m.all.isEmptyOrValidSet, isTrue);

    var a = Set.of(m.all.eval());
    expect(a.length, equals(3));
  });
}
