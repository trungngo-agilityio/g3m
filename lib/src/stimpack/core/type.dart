part of g3.stimpack.core;

// region DataType

enum DataTypeCollectionType { array, list, set }

class DataType extends Expr<DataType> {
  bool _mutable;

  bool get mutable => _mutable;

  DataTypeCollectionType _collectionType;

  DataTypeCollectionType get collectionType => _collectionType;

  DataType _itemType;

  DataType get itemType => _itemType;

  DataType asArray() =>
      asCollection(DataTypeCollectionType.array, mutable: false);

  DataType asMutableArray() =>
      asCollection(DataTypeCollectionType.array, mutable: true);

  DataType asList() =>
      asCollection(DataTypeCollectionType.list, mutable: false);

  DataType asMutableList() =>
      asCollection(DataTypeCollectionType.list, mutable: true);

  DataType asSet() => asCollection(DataTypeCollectionType.set, mutable: false);

  DataType asMutableSet() =>
      asCollection(DataTypeCollectionType.set, mutable: true);

  DataType asCollection(DataTypeCollectionType type, {bool mutable = false}) {
    var s = type.toString().split('.').last + ' of ';
    if (mutable) s = 'mutable ' + s;
    return _scope.make()
      ..name = name << s
      .._mutable = mutable
      .._collectionType = type
      .._itemType = this;
  }

  DataType(DataTypeScope scope) : super(scope);
}

class DataTypeScope extends Scope<DataType> {
  final ConstraintScope constraintScope;

  DataTypeScope(this.constraintScope);

  @override
  DataType make() => DataType(this);

  DataType call(Object name) {
    return add(name);
  }
}

// endregion
