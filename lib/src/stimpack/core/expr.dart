part of g3.stimpack.core;

// region Expr

abstract class Expr<T extends Expr<T>> {
  final Scope<T> _scope;

  Scope<T> get scope => _scope;

  /// The expression name.
  Name name;

  Expr(this._scope);

  @override
  String toString() {
    return name.toString();
  }

  // ---------------------------------------------------------------------------
  // Valid
  // ---------------------------------------------------------------------------

  /// True indicates that this is a single expression, not a set.
  bool get isSingle => _items == null;

  /// True indicates that this is a single expression, and a valid one.
  ///
  bool get isValidSingle => _items == null && _isValid();

  /// True indicates that the expression is an empty set.
  ///
  bool get isEmptySet => _items != null && _items.isEmpty;

  /// True indicates that this is either a single or a non empty set.
  ///
  bool get isNonEmptySet => _items == null || _items.isNotEmpty;

  bool get isNonEmptyValidSet => _isValidSet(true);

  bool get isEmptyOrValidSet => _isValidSet(false);

  bool get isEmptyOrValidSingle => isEmptySet || isValidSingle;

  /// Child class would need to override this function to check
  /// if an expression is valid or not.
  ///
  bool _isValid() => true;

  bool _isValidSet(bool required) {
    var items = eval();
    for (var i in items) {
      if (!i._isValid()) {
        return false;
      }
    }

    return !required || items.isNotEmpty;
  }

  @override
  bool operator ==(other) {
    return name.toString() == (other.name.toString() ?? '');
  }

  // ---------------------------------------------------------------------------

  // Clone
  // ---------------------------------------------------------------------------

  /// Child class must implement this operation if there are custom
  /// properties of the expression need to be clone.
  ///
  T clone() => _scope.make()
    ..name = name
    .._items = _items == null ? null : Set.of(_items);

  // ---------------------------------------------------------------------------
  // Operators
  // ---------------------------------------------------------------------------

  Set<T> _items;

  T operator +(T another) {
    // None + X = X
    if (this == _scope.none) return another ?? _scope._none;

    // X + None = X
    if (another == null || another == another._scope.none) return this;

    // X + Y = { X,Y }
    return _plus(another);
  }

  T _plus(T another) {
    var items = <T>{};

    if (_items == null) {
      items.add(this);
    } else {
      items.addAll(_items);
    }

    if (another._items == null) {
      items.add(another);
    } else {
      items.addAll(another._items);
    }

    return _build(items);
  }

  T _build(Set<T> items) {
    if (items.isEmpty) return _scope.none;
    if (items.length == 1) {
      return items.first;
    }

    return _scope.make()
      ..name = Name('? v')
      .._items = items;
  }

  T operator -(T another) {
    if (another == null || another == another._scope.none) return this;

    var items = <T>{};

    if (_items == null) {
      items.add(this);
    } else {
      items.addAll(_items);
    }

    if (another._items == null) {
      items.remove(another);
    } else {
      items.removeAll(another._items);
    }

    return _build(items);
  }

  T operator ^(Object another) {
    var s = _evalObject(another);
    var items = <T>{};
    for (var i in eval()) {
      for (var j in s) {
        items.add(i.clone()..name = i.name ^ j);
      }
    }

    return _build(items);
  }

  T operator <<(Object another) {
    var s = _evalObject(another);
    var items = <T>{};
    for (var i in eval()) {
      for (var j in s) {
        items.add(i.clone()..name = i.name << j);
      }
    }

    return _build(items);
  }

  T operator >>(Object another) {
    var s = _evalObject(another);
    var items = <T>{};
    for (var i in eval()) {
      for (var j in s) {
        items.add(i.clone()..name = i.name >> j);
      }
    }

    return _build(items);
  }

  Set<Object> _evalObject(Object another) {
    if (another is Expr) {
      return another.eval();
    } else {
      return {another};
    }
  }

  // ---------------------------------------------------------------------------
  // Evaluation
  // ---------------------------------------------------------------------------

  Set<T> eval() {
    if (_items == null) return {this};
    if (_items.length == 1) return {_items.single};
    return _items;
  }

  T filter(bool Function(T t) predicate) {
    var res = _scope.none;
    for (final i in eval()) {
      if (predicate(i)) {
        res += i;
      }
    }
    return res;
  }

  T filterByName(dynamic name) {
    final n = name?.toString();
    return filter((t) => t.name?.toString() == n);
  }

  bool contains(T t) {
    for (final i in t.eval()) {
      var found = false;
      for (final j in eval()) {
        if (j == i) {
          found = true;
          break;
        }
      }

      if (!found) return false;
    }

    return true;
  }
}

// ---------------------------------------------------------------------------
// String extensions for easy operator.
// ---------------------------------------------------------------------------
extension StringExprExtension<T extends Expr<T>> on String {
  // For building name easier.
  T operator >>(T another) {
    return another << this;
  }

  T operator <<(T another) {
    return another >> this;
  }
}

// endregion
