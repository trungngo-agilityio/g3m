import 'package:g3m/stimpack_core.dart';
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

class _FakeSymbolNamed extends StimSymbol<_FakeSymbol> implements StimNamed {
  @override
  StimName name;
}

class _FakeSymbolNamedRef extends StimSymbolRef<_FakeSymbolNamed>
    implements _FakeSymbolNamed {}

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

  test('toString - no name', () {
    var ref1 = _FakeSymbolRef();
    expect(ref1.toString(), equals('_FakeSymbolRef<null>'));

    ref1.symbol = _FakeSymbol();
    expect(ref1.toString(), equals('_FakeSymbolRef<_FakeSymbol{}>'));
  });

  test('toString - with name', () {
    var ref1 = _FakeSymbolNamedRef();
    expect(ref1.toString(), equals('_FakeSymbolNamedRef{name: null}<null>'));

    // Test the ability to rename a ref
    ref1.symbol = _FakeSymbolNamed()..name = StimName.of('hello');
    ref1.name = StimName.of('world');
    expect(
        ref1.toString(),
        equals(
            '_FakeSymbolNamedRef{name: world}<_FakeSymbolNamed{name: hello}>'));
  });
}
