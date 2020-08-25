part of g3.stimpack.base;

abstract class StimScope<T, S> {
  T get none;

  S get noneSet;
}

abstract class StimScopeImpl<T extends StimSymbol<T, S>,
    S extends StimSymbolSet<T, S>> implements StimScope<T, S> {
  T _none;
  S _noneSet;

  @override
  T get none => _none;

  @override
  S get noneSet => _noneSet;

  StimScopeImpl() {
    _none = create();
    _noneSet = createSet([]);
  }

  void init() {
    clear(_none);
  }

  int _counter = 0;

  T createAndClear(dynamic name) {
    Name n;

    if (name is Name) {
      n = name;
    } else {
      n = Name(name?.toString() ?? '${T.toString()}_${_counter++}');
    }
    final res = create();
    res.name = n;
    clear(res);
    return res;
  }

  T create();

  S createSet(List<T> items);

  void clear(T symbol);
}
