import 'package:g3m/g3m.dart';
import 'package:test/test.dart';

class FakeSymbol extends Expr<FakeSymbol> {
  FakeSymbol(FakeSymbolScope scope) : super(scope);
}

class FakeSymbolScope extends Scope<FakeSymbol> {
  @override
  FakeSymbol make() => FakeSymbol(this);

  FakeSymbol call(String name) {
    return add(name);
  }
}

void main() {
  test('valid - all', () {
    var symbol = FakeSymbolScope();

    // All is a valid collection
    expect(symbol.all.isEmptySet, isTrue);
    expect(symbol.all.isEmptyOrValidSet, isTrue);
    expect(symbol.all.isNonEmptyValidSet, isFalse);

    expect(symbol.all.isEmptyOrValidSingle, isTrue);
    expect(symbol.all.isSingle, isFalse);
    expect(symbol.all.isValidSingle, isFalse);

    // Adds a new symbol in so that the collection is no longer empty.
    var a = symbol('a');
    expect(a.isValidSingle, isTrue);

    expect(symbol.all.isEmptySet, isFalse);
    expect(symbol.all.isEmptyOrValidSet, isTrue);
    expect(symbol.all.isNonEmptyValidSet, isTrue);

    // True because `all` just contains 1 element now.
    expect(symbol.all.isEmptyOrValidSingle, isTrue);
    expect(symbol.all.isSingle, isTrue);
    expect(symbol.all.isValidSingle, isTrue);

    var b = symbol('b');
    expect(b.isValidSingle, isTrue);

    expect(symbol.all.isEmptySet, isFalse);
    expect(symbol.all.isEmptyOrValidSet, isTrue);
    expect(symbol.all.isNonEmptyValidSet, isTrue);

    // False because `all` contains 2 elements now.
    expect(symbol.all.isEmptyOrValidSingle, isFalse);
    expect(symbol.all.isSingle, isFalse);
    expect(symbol.all.isValidSingle, isFalse);
  });

  test('valid - single', () {
    var symbol = FakeSymbolScope();
    var a = symbol('a');
  });

  test('valid - plus', () {
    var symbol = FakeSymbolScope();
    var a = symbol('a');
    var b = symbol('b');
    var ab = a + b;

    expect(a.isValidSingle, isTrue);

    expect(b.isValidSingle, isTrue);

    expect(ab.isNonEmptyValidSet, isTrue);
  });

  test('clone', () {
    var symbol = FakeSymbolScope();
    var a = symbol('a');

    var list = List.of(symbol.all.eval());
    expect(list.length, equals(1));

    // Clone a, this should not affect the number of symbols because
    // that is not made.
    var b = a.clone();

    list = List.of(symbol.all.eval());
    expect(list.length, equals(1));

    expect(a, equals(b));
  });

  test('add vs. ref', () {
    var symbol = SymbolScope();
    var a = symbol('a');

    // Expects to get out two different symbols
    var b = symbol('b');
    expect(b, isNot(equals(a)));

    // Should get out the same symbol as before.
    var b1 = symbol('b');
    expect(b, equals(b1));
  });

  test('>> operator', () {
    var symbol = SymbolScope();
    var a = symbol('a');
    var b = symbol('b');
    var c = symbol('c');
    var d = symbol('d');

    var e = (a + b) >> (c + d);
    var s = List.of(e.eval());
    expect(s.length, equals(4));
    expect(s[0].name.toString(), equals('a c'));
    expect(s[1].name.toString(), equals('a d'));
    expect(s[2].name.toString(), equals('b c'));
    expect(s[3].name.toString(), equals('b d'));
  });

  test('<< operator', () {
    var symbol = SymbolScope();
    var a = symbol('a');
    var b = symbol('b');
    var c = symbol('c');
    var d = symbol('d');

    var e = (a + b) << (c + d);
    var s = List.of(e.eval());
    expect(s.length, equals(4));
    expect(s[0].name.toString(), equals('c a'));
    expect(s[1].name.toString(), equals('d a'));
    expect(s[2].name.toString(), equals('c b'));
    expect(s[3].name.toString(), equals('d b'));
  });

  test('^ operator', () {
    var symbol = SymbolScope();
    var a = symbol('a');
    var b = symbol('b');
    var c = symbol('c');

    var d = a ^ (b + c);
    var s = List.of(d.eval());
    expect(s.length, equals(2));
    expect(s[0].name.toString(), equals('b'));
    expect(s[1].name.toString(), equals('c'));
  });
}
