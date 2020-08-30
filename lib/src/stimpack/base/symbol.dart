part of g3.stimpack.base;

/// Symbol is the most basic element of the framework. It is
/// the abstract class that provides basic functions for
/// concrete package symbol implements can inherit from.
///
/// Example of symbol for OOP modeling are : "model", "field", "type", etc.
///
/// Symbol provides math operations to quickly write builder code
/// that models the software world. For instance, to make sure a bunch
/// of model have name fields are required, we can do like:
///
///   models = model('product') + model('category')
///   required = rule('required')
///   name = field('name', rules: required)
///   models.fields += name
///
/// Math operations:
/// -----------------
///   X = A op B, in which
///   X is the result of the operation, which is always a symbol set.
///   A, B is a symbol instance or set.
///   op: +, -, ^, ...
///
/// See [StimSymbolSet] to understand what are the operation of a
/// symbol set.
///
///
abstract class StimSymbol<T extends StimSymbol<T, S>,
    S extends StimSymbolSet<T, S>> {
  /// The symbol name
  Name name;

  /// The scope that the symbol is created from.
  final StimScopeImpl<T, S> _scope;

  StimSymbol(this._scope) : assert(_scope != null);

  /// Clones the symbol. This will invoke the scope's clear
  /// function let custom implementation on how the symbol's fields
  /// should be clone.
  T clone() {
    return _scope.createAndClear(name);
  }

  @override
  String toString() {
    return name.toString();
  }

  /// Adds symbols and make a set.
  ///
  S operator +(dynamic another) {
    if (another == null || another == _scope.none) {
      return _scope.createSet([this]);
    }

    final items = <T>[this];

    if (another is S) {
      // if another is a set.
      items.addAll(another._items);
      return _scope.createSet(items);
    } else if (another is T) {
      // if another is a symbol
      if (!another.isNone) items.add(another);
      return _scope.createSet(items);
    }

    throw 'cannot add $runtimeType with ${another.runtimeType}';
  }

  bool get isNone => _scope.none == this;
}
