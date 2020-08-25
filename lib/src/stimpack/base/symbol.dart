part of g3.stimpack.base;

class StimSymbol<T extends StimSymbol<T, S>, S extends StimSymbolSet<T, S>> {
  /// The symbol name
  Name name;

  final StimScopeImpl<T, S> _scope;

  StimSymbol(this._scope) : assert(_scope != null);

  T clone() {
    return _scope.createAndClear(name);
  }

  @override
  String toString() {
    return name.toString();
  }

  S operator +(dynamic another) {
    if (another == null || another == _scope.none) {
      return _scope.createSet([this]);
    }

    final items = <T>[this];
    if (another is S) {
      items.addAll(another._items);
      return _scope.createSet(items);
    } else if (another is T) {
      items.add(another);
      return _scope.createSet(items);
    }

    throw 'cannot add $runtimeType with ${another.runtimeType}';
  }
}
