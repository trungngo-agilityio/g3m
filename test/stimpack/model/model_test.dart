import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:test/test.dart';

class _FakeSymbol extends StimModelSymbol<_FakeSymbol> {}

void main() {
  final m = stimpack.model, t = m.type;
  final typeTag = 'my';
  final symbolTag = 'symbol';
  test('load test', () {
    print(stimpack.model.type.bool);
  });

  group('tags', () {
    final type1 = t.of(name: 'type1', package: null);
    final symbol1 = _FakeSymbol()..name = StimName.of('symbol1');
    final symbol2 = _FakeSymbol()..name = StimName.of('symbol2');
    final type2 = t.of(name: 'type2', package: null);

    test('add & remove', () {
      final symbolTag1 = type1.addTag(name: symbolTag, value: symbol1);

      expect(symbolTag1, isNotNull);
      expect(symbolTag1.value, equals(symbol1));

      type1.addTag(name: symbolTag, value: symbol2);
      type1.addTag(name: typeTag, value: type2);

      final t2_tag = type1.firstValueOfTag<_FakeSymbol>(symbolTag);
      assert(t2_tag != null);
      assert(symbol1 == t2_tag);
      assert(t2_tag.name == symbol1.name);

      var ts = type1.allValuesOfTag<_FakeSymbol>(symbolTag);
      print(ts);
      expect(
          ts,
          allOf([
            hasLength(2),
            contains(symbol1),
            contains(symbol2),
          ]));

      type1.removeTag(name: symbolTag, value: symbol1);
      ts = type1.allValuesOfTag<_FakeSymbol>(symbolTag);
      expect(
          ts,
          allOf([
            hasLength(1),
            contains(symbol2),
          ]));
    });
  });
}
