part of g3.stimpack.base;

typedef StimSymbolOpFunc<T, FS> = void Function(T child, FS items);

abstract class StimSymbolSetOp<
    T extends StimSymbol<T, S>,
    S extends StimSymbolSet<T, S>,
    FT extends StimSymbol<FT, FS>,
    FS extends StimSymbolSet<FT, FS>> {
  StimSymbolSetOp<T, S, FT, FS> operator ^(dynamic other);

  StimSymbolSetOp<T, S, FT, FS> operator +(dynamic other);
}

abstract class StimSymbolSetOpImpl<
    T extends StimSymbol<T, S>,
    S extends StimSymbolSet<T, S>,
    FT extends StimSymbol<FT, FS>,
    FS extends StimSymbolSet<FT, FS>> implements StimSymbolSetOp<T, S, FT, FS> {
  final StimSymbolSet symbols;
  final StimScopeImpl<FT, FS> scope;

  StimSymbolSetOpImpl(this.symbols, StimScope<FT, FS> scope)
      : scope = scope as StimScopeImpl<FT, FS>;

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
    _execute('set', onSet, value);
    return this;
  }

  @override
  StimSymbolSetOpImpl<T, S, FT, FS> operator +(dynamic value) {
    _execute('set', onAdd, value);
    return this;
  }

  void onSet(T child, FS values);

  void onAdd(T child, FS values);
}
