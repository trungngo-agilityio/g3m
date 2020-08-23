part of g3.stimpack.core;

/// Defines a field prototype.
///
class Field extends Expr<Field> {
  @override
  final FieldScope _scope;

  Field._(this._scope) : super(_scope);

  // ---------------------------------------------------------------------------
  // Type
  // ---------------------------------------------------------------------------
  DataType _type;

  DataType get type => _type;

  set type(value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._type = value;
    }
  }

  // ---------------------------------------------------------------------------
  // Constraint
  // ---------------------------------------------------------------------------
  Constraint _constraints;

  Constraint get constraints => _constraints;

  set constraints(Constraint value) {
    assert(value != null, 'value is required');

    for (var i in eval()) {
      i._constraints = value;
    }
  }

  // ---------------------------------------------------------------------------
  // isValid
  // ---------------------------------------------------------------------------
  @override
  bool _isValid() {
    assert(_type != null);
    assert(_constraints != null);

    return _type.isValidSingle && _constraints.isEmptyOrValidSet;
  }

  // ---------------------------------------------------------------------------
  // Clone
  // ---------------------------------------------------------------------------

  @override
  Field clone() {
    return super.clone()
      .._type = _type
      .._constraints = _constraints;
  }
}

/// Defines a field prototype.
///
class FieldScope extends Scope<Field> {
  final DataTypeScope _type;

  final ConstraintScope _constraint;

  FieldScope(this._type, this._constraint);

  @override
  Field make() => Field._(this)
    .._type = _type.none
    .._constraints = _constraint.none;

  Field call(String name, [DataType type, Constraint constraint]) {
    return add(name)
      .._type += type
      .._constraints += constraint;
  }
}
