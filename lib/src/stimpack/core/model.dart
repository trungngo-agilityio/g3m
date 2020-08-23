part of g3.stimpack.core;

/// A model has a set of [fields].
///
class Model extends Expr<Model> {
  @override
  final ModelScope _scope;

  Model(this._scope) : super(_scope);

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------
  Field _fields;

  Field get fields => _fields;

  set fields(Field value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._fields = value;
    }
  }

  /// A model is valid when it has at least 1 field and all fields
  /// are valid.
  ///
  @override
  bool _isValid() => _fields.isNonEmptyValidSet;

  @override
  Model clone() => super.clone().._fields = _fields;

  DataType asDataType() => _scope._field._type.make()..name = name;

  /// A quick way to add a field into the model.
  Field operator [](Field idx) {
    return idx << name;
  }
}

class ModelScope extends Scope<Model> {
  final FieldScope _field;

  ModelScope(this._field);

  @override
  Model make() => Model(this).._fields = _field.none;

  Model call(String name, {Field fields}) {
    return add(name).._fields += fields;
  }
}
