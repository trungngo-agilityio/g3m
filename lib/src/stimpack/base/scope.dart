part of g3.stimpack.base;

/// Scope is a factory that produces symbol. It is important to note
/// that null value does not work well with dart math operations. So
/// it is required that any null symbol should use [StimScope.none]
/// and any null symbol set should use [StimScope.noneSet] instead.
///
abstract class StimScope<T, S> {
  /// All reference to symbols produced by this scope
  /// should use this instance instead of null.
  T get none;

  /// All reference to symbol sets produced by this scope
  /// should use this instance instead of null.
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

  StimScopeImpl();

  /// Two phase init, this define a [none] and and [noneSet]
  /// instance. It is important to note that these objects
  /// cannot be created in the constructor because of cyclic dependency.
  void init() {
    _none = create();
    _noneSet = createSet([]);
    clear(_none);
  }

  T createAndClear(dynamic name) {
    Name n;

    if (name is Name) {
      n = name;
    } else {
      n = Name(name?.toString() ?? '');
    }
    final res = create();
    res.name = n;
    clear(res);
    return res;
  }

  /// Just create a new symbol. This instance is not ready to be used
  /// yet as it must be clear first.
  T create();

  /// Creates a new symbol set with the specified symbol list.
  S createSet(List<T> symbols);

  /// Given a symbol, this function need to clear all symbol sub fields
  /// to none or none set.
  void clear(T symbol);
}
