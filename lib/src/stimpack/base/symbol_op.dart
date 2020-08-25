part of g3.stimpack.base;

/// Defines an operation perform on a field of a symbol set.
/// It is quite hard to understand this magic class, please consider
/// the following example:
///   - we are using the "model" package to model the database models.
///   - There are a lot of models that have many common fields like
///     name, desc, version, createdAt, updatedAt, ... and we need
///     a quick way to add all those fields into all models.
///   - Here is the code for it
///     all = product + category + productBrand + manufacturer
///     all.fields.set(name + desc + version + createdAt + updatedAt).
///
/// This class provide a base class on how "fields.add" work. Custom
/// package shall need to extends and provide custom implementation
/// of some functions like [onSet], [onAdd], etc to define how things
/// should work.
///
abstract class StimSymbolOp<
    T extends StimSymbol<T, S>,
    S extends StimSymbolSet<T, S>,
    FT extends StimSymbol<FT, FS>,
    FS extends StimSymbolSet<FT, FS>> {
  StimSymbolOp<T, S, FT, FS> operator ^(dynamic other);
}

abstract class StimSymbolOpImpl<
    T extends StimSymbol<T, S>,
    S extends StimSymbolSet<T, S>,
    FT extends StimSymbol<FT, FS>,
    FS extends StimSymbolSet<FT, FS>> implements StimSymbolOp<T, S, FT, FS> {
  final StimSymbolSet _symbols;
  final StimScopeImpl<FT, FS> _scope;

  StimSymbolOpImpl(this._symbols, StimScope<FT, FS> scope)
      : assert(_symbols != null),
        assert(scope != null),
        _scope = scope as StimScopeImpl<FT, FS>;

  void _execute(String op, StimSymbolOpFunc<T, FT> func, value) {
    if (value == null) return;
    if (value is FT) {
      for (final i in _symbols) {
        func(i, value);
      }
    } else if (value is FS) {
      final list = List<FT>.of(value);
      FT item;
      if (list.length > 1) {
        throw 'cannot assign multiple value to a single value type.';
      } else if (list.isNotEmpty) {
        item = list.first;
      }

      for (final i in _symbols) {
        func(i, item);
      }
    } else {
      throw 'cannot $op ${value.runtimeType} type to $FT type';
    }
  }

  @override
  StimSymbolOpImpl<T, S, FT, FS> operator ^(dynamic value) {
    _execute('set', onSet, value);
    return this;
  }

  void onSet(T child, FT value);
}
