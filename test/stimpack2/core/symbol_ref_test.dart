import 'package:g3m/stimpack2_core.dart';
import 'package:test/test.dart';

class _FakeSymbol extends StimSymbol<_FakeSymbol> {
  int intField;
  _FakeSymbol refField;

  String hello() {
    return 'hello';
  }
}

class _FakeSymbolRef extends StimSymbolRef<_FakeSymbol> implements _FakeSymbol {
}

void main() {
  test('ref', () {
    final s1 = _FakeSymbol()..intField = 5;
    final s2 = _FakeSymbolRef();

    assert(s2.intField == null);
    assert(s2.hello() == null);

    s2.symbol = s1;
    assert(s2.intField == 5);
    assert(s2.hello() == 'hello');

    // This set only affect the ref, not the original symbol
    s2.intField = 10;
    assert(s1.intField == 5);
    assert(s2.intField == 10);

    s1.refField = s2;
    assert(s2 == s2.clone());

    // The ref field should not be clone.
    assert(s2.refField == s2);
  });
}
