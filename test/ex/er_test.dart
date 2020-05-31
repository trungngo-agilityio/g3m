import 'package:g3m/g3mex.dart';
import 'package:test/test.dart';

void main() {
  test('name', () {
    var p = PatternScopeEx();
    var c = ConstraintScopeEx(p);
    var t = DataTypeScopeEx(c);
    var f = FieldScopeEx(t, c);
    var m = ModelScopeEx(f);

    var erRelCardinal = ErRelationCardinalScopeEx();
    var erRelType = ErRelationTypeScopeEx(erRelCardinal);
    var erRel = ErRelationScopeEx(m, erRelType);

    expect(erRel.all.isEmptyOrValidSet, isTrue);

    var a = Set.of(erRel.all.eval());
    expect(a.length, equals(1));
    print(a);
    print(m.userProfile.fields);
    print(m.user.fields);
  });
}
