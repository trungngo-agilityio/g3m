part of g3m.core;

abstract class Scope<T extends Expr<T>> {
  /// Special expression which is a set of all "named" expressions
  /// available in the scope. This is helpful in the case
  /// that you just want to loop through all models, fields, etc.
  T get all => _all;
  T _all;

  /// This is the special expression that could help to eliminate
  /// null checking.
  T get none => _none;
  T _none;

  Scope() {
    _all = _none = make()
      ..name = Name('none')
      .._items = {};
  }

  /// Any concrete implementation must implement this method
  /// to create new object.
  T make();

  int _counter = 0;

  /// Adds a new named expression to the scope.
  ///
  T add(dynamic name) {
    var n = name?.toString() ?? '@anon${_counter++}';
    var item = make();
    item.name = Name(n);
    _all += item;
    return item;
  }

  void build() {}
}
