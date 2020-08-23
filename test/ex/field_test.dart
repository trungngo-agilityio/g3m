import 'package:g3m/stimpack_ex.dart';
import 'package:test/test.dart';

void main() {
  test('all', () {
    var p = PatternScopeEx();
    var c = ConstraintScopeEx(p);
    var t = DataTypeScopeEx(c);
    var f = FieldScopeEx(t, c);

    expect(f.all.isEmptyOrValidSet, isTrue);

    var a = Set.of(f.all.eval());
    expect(a.length, equals(30));
  });
}
