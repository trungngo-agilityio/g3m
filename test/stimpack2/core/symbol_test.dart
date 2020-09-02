import 'package:g3m/stimpack2_core.dart';
import 'package:test/test.dart';

class FakeSymbol extends StimSymbol<FakeSymbol> {
  String stringField;
  int intField;
  double doubleField;
  num numField;
  FakeSymbol fakeSymbol;
  Set<String> stringSet;
  List<int> intList;
  Set<FakeSymbol> fakeSymbolSet;
  List<FakeSymbol> fakeSymbolList;
}

void main() {
  test('clone', () {
    final s1 = FakeSymbol()
      ..stringField = 'x'
      ..intField = 5
      ..doubleField = 10
      ..numField = 15;

    final symbolField = FakeSymbol()..stringField = 'y';
    s1.fakeSymbol = symbolField;

    final stringSet1 = {'z'};
    s1.stringSet = stringSet1;

    final intList1 = [15];
    s1.intList = intList1;

    final s2 = s1.clone();

    // make sure new instance created
    assert(s1 != s2);

    // make sure fields are deep cloned
    assert(s1.stringField == s2.stringField);
    assert(s1.intField == s2.intField);
    assert(s1.numField == s2.numField);
    assert(s1.doubleField == s2.doubleField);

    // the object is not cloned
    assert(s1.stringSet == s2.stringSet);
    assert(s1.intList == s2.intList);
    assert(s1.fakeSymbol == s2.fakeSymbol);
  });

  test('deep clone', () {
    final s1 = FakeSymbol()..stringField = 'x';

    final symbolField1 = FakeSymbol()..stringField = 'y';
    s1.fakeSymbol = symbolField1;

    final stringSet1 = {'z'};
    s1.stringSet = stringSet1;

    final intList1 = [15];
    s1.intList = intList1;

    final symbolField2 = FakeSymbol()..stringField = 'y';
    final symbolSet1 = {symbolField1, symbolField2};
//    s1.fakeSymbolSet = symbolSet1;

    // FIXME: Deep clone not work yet, need to figure out the way
//    final s2 = s1.deepClone();
//    assert(s1.stringSet != s2.stringSet);
//    assert(s1.intList != s2.intList);
//    assert(s1.fakeSymbol != s2.fakeSymbol);
//    assert(s1.fakeSymbolSet != s2.fakeSymbolSet);
//    assert(s1.fakeSymbolSet.first != s2.fakeSymbolSet.first);
//    assert(s1.fakeSymbol.stringField == s2.fakeSymbol.stringField);
  });

  group('+ operator', () {
    Set<FakeSymbol> noneSet;
    FakeSymbol none;
    final empty = <FakeSymbol>{};

    final s1 = FakeSymbol();
    final set1 = {s1};

    final s2 = FakeSymbol();
    final set2 = {s2};

    test('none set goes first', () {
      assert(noneSet == noneSet + none);
      assert(noneSet == noneSet + noneSet);

      final noneSetPlusEmpty = noneSet + empty;
      assert(empty != noneSetPlusEmpty && noneSetPlusEmpty.isEmpty);

      final noneSetPlusSet = noneSet + set1;
      assert(set1 != noneSetPlusSet && noneSetPlusSet.first == s1);
    });

    test('none goes first', () {
      assert(noneSet == none + none);
      final nonePlusEmpty = none + empty;

      assert(empty != nonePlusEmpty && nonePlusEmpty.isEmpty);
      assert(noneSet == none + noneSet);

      final nonePlusSet = none + set1;
      assert(set1 != nonePlusSet && nonePlusSet.first == s1);
    });

    test('set + set', () {
      final setPlusSet = set1 + set2;
      assert(setPlusSet.contains(s1) && setPlusSet.contains(s2));
    });
  });
}
