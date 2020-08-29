part of g3.stimpack.base;

typedef StimSymbolOpFunc<T, FS> = void Function(T child, FS items);

abstract class StimSymbolSetOp<
    T extends StimSymbol<T, S>,
    S extends StimSymbolSet<T, S>,
    FT extends StimSymbol<FT, FS>,
    FS extends StimSymbolSet<FT, FS>> {
  StimSymbolSetOp<T, S, FT, FS> operator ^(dynamic other);

  void set(dynamic other);

  StimSymbolSetOp<T, S, FT, FS> operator +(dynamic other);

  void add(dynamic other);
}

abstract class StimSymbolSetOpImpl<
    T extends StimSymbol<T, S>,
    S extends StimSymbolSet<T, S>,
    FT extends StimSymbol<FT, FS>,
    FS extends StimSymbolSet<FT, FS>> implements StimSymbolSetOp<T, S, FT, FS> {
  final StimSymbolSet symbols;
  final StimScopeImpl<FT, FS> scope;

  StimSymbolSetOpImpl(this.symbols, StimScope<FT, FS> scope)
      : assert(symbols != null),
        assert(scope != null),
        scope = scope as StimScopeImpl<FT, FS>;

  void _execute(String op, StimSymbolOpFunc<T, FS> func, value) {
    if (value == null) return;
    if (value is FT) {
      for (final i in symbols) {
        func(i, scope.createSet(<FT>[value]));
      }
    } else if (value is FS) {
      for (final i in symbols) {
        func(i, value);
      }
    } else {
      throw 'cannot $op ${value.runtimeType} type to $FT type';
    }
  }

  @override
  StimSymbolSetOpImpl<T, S, FT, FS> operator ^(dynamic value) {
    set(value);
    return this;
  }

  @override
  void set(dynamic value) {
    _execute('set', onSet, value);
  }

  @override
  StimSymbolSetOpImpl<T, S, FT, FS> operator +(dynamic value) {
    add(value);
    return this;
  }

  @override
  void add(dynamic value) {
    _execute('add', onAdd, value);
  }

  /// Gives a symbol in a set, sub class must implement this function
  /// to define how to set a [child] symbol's related field with the specified
  /// [values] symbol set.
  void onSet(T child, FS values);

  /// Gives a symbol in a set, sub class must implement this function
  /// to define how to add a [child] symbol's related field with the specified
  /// [values] symbol set.
  void onAdd(T child, FS values);
}
