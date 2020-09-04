import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:test/test.dart';

class _FakeSymbol extends StimModelSymbol<_FakeSymbol> {}

void main() {
  final m = stimpack.model, t = m.type;
  test('load test', () {
    print(stimpack.model.type.bool);
  });

  group('tags', () {
    final t1 = t.of(name: 't1', package: null);
    final t2 = _FakeSymbol()..name = StimName.of('t2');
    final t3 = _FakeSymbol()..name = StimName.of('t3');
    final t4 = t.of(name: 't4', package: null);

    test('add & remove', () {
      final tag1 = t1.addSymbolAsTag(t2);
      assert(tag1 != null);
      assert(tag1.value == t2);

      t1.addSymbolAsTag(t3);
      t1.addSymbolAsTag(t4);

      final t2_tag = t1.firstTaggedSymbolOfExactType<_FakeSymbol>();
      assert(t2_tag != null);
      assert(t2 == t2_tag);
      assert(t2_tag.name == t2.name);

      var ts = t1.allTaggedSymbolsOfExactType<_FakeSymbol>();
      assert(ts?.length == 2);
      assert(ts.contains(t2));
      assert(ts.contains(t3));

      t1.removeTaggedSymbol(t2);
      ts = t1.allTaggedSymbolsOfExactType<_FakeSymbol>();
      assert(ts?.length == 1);
      assert(!ts.contains(t2));
      assert(ts.contains(t3));
    });
  });
}
