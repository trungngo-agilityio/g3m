part of g3.stimpack.base;

class StimSymbolSet<T extends StimSymbol<T, S>, S extends StimSymbolSet<T, S>>
    implements Iterable<T> {
  final StimScopeImpl<T, S> _scope;

  final List<T> _items;

  StimSymbolSet(this._scope, this._items)
      : assert(_scope != null),
        assert(_items != null);

  S clone() {
    return _scope.createSet(List<T>.of(_items));
  }

  set add(dynamic another) {}

  set set(dynamic another) {}

  set remove(dynamic another) {}

  S operator +(dynamic another) {
    if (another == null || another == _scope.none) return this;

    final items = List<T>.from(_items);
    if (another is S) {
      items.addAll(another._items);
      return _scope.createSet(items);
    } else if (another is T) {
      items.add(another);
      return _scope.createSet(items);
    }

    throw 'cannot add $runtimeType with ${another.runtimeType}';
  }

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
