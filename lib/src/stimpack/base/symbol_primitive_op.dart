part of g3.stimpack.base;

abstract class StimSymbolPrimitiveOp<T, FT> {
  void set(dynamic value);

  StimSymbolPrimitiveOp<T, FT> operator ^(dynamic value);
}

abstract class StimSymbolPrimitiveOpImpl<T, FT>
    extends StimSymbolPrimitiveOp<T, FT> {
  final Iterable<T> _symbols;

  StimSymbolPrimitiveOpImpl(this._symbols) : assert(_symbols != null);

  void _execute(String op, Function(T child, FT value) func, value) {
    if (value == null) return;
    if (value is FT) {
      for (final i in _symbols) {
        func(i, value);
      }
    } else {
      throw 'cannot $op ${value.runtimeType} type to $FT type';
    }
  }

  @override
  StimSymbolPrimitiveOp<T, FT> operator ^(dynamic value) {
    set(value);
    return this;
  }

  @override
  void set(value) {
    _execute('set', onSet, value);
  }

  void onSet(T child, FT value);
}
