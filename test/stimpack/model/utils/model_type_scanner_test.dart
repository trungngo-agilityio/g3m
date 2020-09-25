import 'package:g3m/stimpack.dart';
import 'package:test/test.dart';

void main() {
  final t = stimpack.model.type;
  final p = stimpack.model.package;
  final f = stimpack.model.field;

  test('null test', () {
    expect(stimModelTypeScan(types: null), isEmpty);
  });

  test('empty test', () {
    expect(stimModelTypeScan(types: {}), isEmpty);
  });

  test('one test', () {
    final t1 = t.of(name: 't1', package: null);
    final res = stimModelTypeScan(types: {t1});
    expect(res.keys, hasLength(1));
    expect(res[null], hasLength(1));
    expect(res[null].first.name.toString(), t1.name.toString());
  });

  test('two types - null package test', () {
    final t1 = t.of(name: 't1', package: null);
    final t2 = t.of(name: 't2', package: null);

    final res = stimModelTypeScan(types: {t1, t2});
    expect(res.keys, hasLength(1));
    expect(res[null], hasLength(2));
    expect(res[null].elementAt(0).name.toString(), t1.name.toString());
    expect(res[null].elementAt(1).name.toString(), t2.name.toString());
  });

  test('two types - two packages test', () {
    final p1 = p.of(name: 'p1');
    final t1 = t.of(name: 't1', package: p1);
    final t2 = t.of(name: 't2', package: p1);

    final res = stimModelTypeScan(types: {t1, t2});
    expect(res.keys, hasLength(1));
    expect(res[p1], hasLength(2));
    expect(res[p1].elementAt(0).name.toString(), t1.name.toString());
    expect(res[p1].elementAt(1).name.toString(), t2.name.toString());
  });

  test('two - two package test', () {
    final p1 = p.of(name: 'p1');
    final p2 = p.of(name: 'p2');
    final t1 = t.of(name: 't1', package: p1);
    final t2 = t.of(name: 't2', package: p2);

    final res = stimModelTypeScan(types: {t1, t2});

    expect(res.keys, hasLength(2));
    expect(res[p1], hasLength(1));
    expect(res[p1].elementAt(0).name.toString(), t1.name.toString());

    expect(res[p2], hasLength(1));
    expect(res[p2].elementAt(0).name.toString(), t2.name.toString());
  });

  test('two types - two packages , in field test', () {
    final p1 = p.of(name: 'p1');
    final p2 = p.of(name: 'p2');

    final t1 = t.of(name: 't1', package: p1);
    final t2 = t.of(name: 't2', package: p2);
    final f11 = f.of(name: 'f11', type: t2);

    // This fields also refers to type2, to test the case of cyclic dependency
    final f22 = f.of(name: 'f22', type: t2);
    t1.fields += f11;
    t2.fields += f22;

    final res = stimModelTypeScan(types: {t1});

    expect(res.keys, hasLength(2));
    expect(res[p1], hasLength(1));
    expect(res[p1].elementAt(0).name.toString(), t1.name.toString());

    expect(res[p2], hasLength(1));
    expect(res[p2].elementAt(0).name.toString(), t2.name.toString());
  });

  test('many types - package packages , in field, and collection test', () {
    final p1 = p.of(name: 'p1');
    final p2 = p.of(name: 'p2');

    final t1 = t.of(name: 't1', package: p1);
    final t2 = t.of(name: 't2', package: p2);
    final t3 = t.of(name: 't3', package: p2);

    final f11 = f.of(name: 'f11', type: t2);

    // This fields also refers to type2, to test the case of cyclic dependency
    final f22 = f.of(name: 'f22', type: t2);
    final f23 = f.of(name: 'f22', type: t3);

    // Test the collection case
    final f31 = f.setOf(name: 'f31', type: t1);

    t1.fields += f11;
    t2.fields += {f22, f23};
    t3.fields += f31;

    // Important that this case starts from t2, and will go back to t1
    // via a field's collection item type.
    final res = stimModelTypeScan(types: {t2});

    expect(res.keys, hasLength(3));
    expect(res[p1], hasLength(1));
    expect(res[p1].elementAt(0).name.toString(), t1.name.toString());

    expect(res[p2], hasLength(2));
    expect(res[p2].elementAt(0).name.toString(), t2.name.toString());
    expect(res[p2].elementAt(1).name.toString(), t3.name.toString());

    final dartSet = stimpack.model.type.set;
    final dartPackage = dartSet.package;
    expect(res[dartPackage], hasLength(2));
    expect(
        res[dartPackage].elementAt(0).name.toString(), 'set < t1 >');
    expect(
        res[dartPackage].elementAt(1).name.toString(), 'set');
  });
}
