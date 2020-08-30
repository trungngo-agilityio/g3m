part of g3.stimpack.base;

/// A symbol set is a set of symbols. Please read the comment on [StimSymbol]
/// to understand on it is possible to perform some math operations
/// on symbol or set to quickly model the software world.
///
/// It is important to note that symbol set implements [Iterable] interface,
/// so it is possible to perform like "for (final i in aSymbolSet)".
///
class StimSymbolSet<T extends StimSymbol<T, S>, S extends StimSymbolSet<T, S>>
    implements Iterable<T> {
  /// The scope that this symbol set make from.
  final StimScopeImpl<T, S> _scope;

  final List<T> _items;

  StimSymbolSet(this._scope, this._items)
      : assert(_scope != null),
        assert(_items != null);

  /// Clones the set to make a new one.
  S clone() {
    return _scope.createSet(List<T>.of(_items));
  }

  // region syntax sugar for symbol set collection

  /// Filters the symbol list to get only symbols without name.
  Iterable<T> whereNoName() {
    return where((element) {
      var empty = element.name?.isEmpty;
      return empty == true || empty == null;
    });
  }

  /// Filters the symbol list to get only symbols with name.
  Iterable<T> whereHasName() {
    return where((element) => element.name?.isNotEmpty == true);
  }

  /// Finds the first symbol by its [name].
  T firstWhereNameIs(dynamic name) {
    return firstWhere((s) => s?.name.toString() == name?.toString(),
        orElse: () => null);
  }

  // endregion

  /// Adds symbols or sets to make new symbol set.
  ///
  S operator +(dynamic another) {
    if (another == null || another == _scope.none) return this;

    final items = List<T>.from(_items);

    if (another is Iterable<T>) {
      // the another is a set.
      items.addAll(another);
      if (items.isEmpty) return _scope.noneSet;
      return _scope.createSet(items);
    } else if (another is T) {
      // the another is a symbol.
      if (!another.isNone) items.add(another);
      if (items.isEmpty) return _scope.noneSet;
      return _scope.createSet(items);
    }

    throw 'cannot add $runtimeType with ${another.runtimeType}';
  }

  bool get isNone => _scope.noneSet == this;

  @override
  String toString() {
    return _items.toString();
  }

  // region Iterable

  @override
  bool any(bool Function(T element) test) {
    return _items.any(test);
  }

  @override
  Iterable<R> cast<R>() {
    return _items.cast();
  }

  @override
  bool contains(Object element) {
    return _items.contains(element);
  }

  @override
  T elementAt(int index) {
    return _items.elementAt(index);
  }

  @override
  bool every(bool Function(T element) test) {
    return _items.every(test);
  }

  @override
  Iterable<X> expand<X>(Iterable<X> Function(T element) f) {
    return _items.expand<X>(f);
  }

  @override
  T get first => _items.first;

  @override
  T firstWhere(bool Function(T element) test, {T Function() orElse}) {
    return _items.firstWhere(test, orElse: orElse);
  }

  @override
  X fold<X>(X initialValue, X Function(X previousValue, T element) combine) {
    return _items.fold<X>(initialValue, combine);
  }

  @override
  Iterable<T> followedBy(Iterable<T> other) {
    return _items.followedBy(other);
  }

  @override
  void forEach(void Function(T element) f) {
    return _items.forEach(f);
  }

  @override
  bool get isEmpty => _items.isEmpty;

  @override
  bool get isNotEmpty => _items.isNotEmpty;

  @override
  Iterator<T> get iterator => _items.iterator;

  @override
  String join([String separator = '']) {
    return _items.join(separator);
  }

  @override
  T get last => _items.last;

  @override
  T lastWhere(bool Function(T element) test, {T Function() orElse}) {
    return _items.lastWhere(test, orElse: orElse);
  }

  @override
  int get length => _items.length;

  @override
  Iterable<X> map<X>(X Function(T e) f) {
    return _items.map<X>(f);
  }

  @override
  T reduce(T Function(T value, T element) combine) {
    return _items.reduce(combine);
  }

  @override
  T get single => _items.single;

  @override
  T singleWhere(bool Function(T element) test, {T Function() orElse}) {
    return _items.singleWhere(test, orElse: orElse);
  }

  @override
  Iterable<T> skip(int count) {
    return _items.skip(count);
  }

  @override
  Iterable<T> skipWhile(bool Function(T value) test) {
    return _items.skipWhile(test);
  }

  @override
  Iterable<T> take(int count) {
    return _items.take(count);
  }

  @override
  Iterable<T> takeWhile(bool Function(T value) test) {
    return _items.takeWhile(test);
  }

  @override
  List<T> toList({bool growable = true}) {
    return _items.toList(growable: growable);
  }

  @override
  Set<T> toSet() {
    return _items.toSet();
  }

  @override
  Iterable<T> where(bool Function(T element) test) {
    return _items.where(test);
  }

  @override
  Iterable<X> whereType<X>() {
    return _items.whereType<X>();
  }

// endregion
}
