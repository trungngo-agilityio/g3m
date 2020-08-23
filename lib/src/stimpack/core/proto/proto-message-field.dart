part of g3.stimpack.core;

class ProtoMessageField extends Expr<ProtoMessageField> {
  @override
  final ProtoMessageFieldScope _scope;

  ProtoMessageField._(this._scope) : super(_scope);

  // ---------------------------------------------------------------------------
  // Position
  // ---------------------------------------------------------------------------
  int _position;

  int get position => _position;

  set position(value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._position = value;
    }
  }

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

    return _position != null &&
        _type.isValidSingle &&
        _constraints.isEmptyOrValidSet;
  }

  // ---------------------------------------------------------------------------
  // Clone
  // ---------------------------------------------------------------------------

  @override
  ProtoMessageField clone() {
    return super.clone()
      .._position = _position
      .._type = _type
      .._constraints = _constraints;
  }
}

class ProtoMessageFieldScope extends Scope<ProtoMessageField> {
  final DataTypeScope _type;

  final ConstraintScope _constraint;

  ProtoMessageFieldScope(this._type, this._constraint);

  @override
  ProtoMessageField make() => ProtoMessageField._(this)
    .._type = _type.none
    .._constraints = _constraint.none;

  ProtoMessageField call(dynamic name,
      {DataType type, Constraint constraints, int position}) {
    return add(name)
      .._type += type
      .._constraints += constraints
      .._position = position ?? 0;
  }

  ProtoMessageField ofFields(Field fields, [int position]) {
    var res = none;

    for (final i in fields.eval()) {
      res += call(
        i.name,
        type: i.type,
        constraints: i.constraints,
        position: position++,
      );
    }

    return res;
  }
}
