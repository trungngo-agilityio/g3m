part of g3m.core;

/// A model has a set of [fields].
///
class ProtoMessage extends Expr<ProtoMessage> {
  @override
  final ProtoMessageScope _scope;

  ProtoMessage(this._scope) : super(_scope);

  // ---------------------------------------------------------------------------
  // ProtoLib
  // ---------------------------------------------------------------------------
  ProtoLib _lib;

  ProtoLib get lib => _lib;

  set lib(ProtoLib value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._lib = value;
    }
  }

  // ---------------------------------------------------------------------------
  // ProtoMessageFields
  // ---------------------------------------------------------------------------
  ProtoMessageField _fields;

  ProtoMessageField get fields => _fields;

  set fields(ProtoMessageField value) {
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
  ProtoMessage clone() => super.clone().._fields = _fields;

  DataType asDataType() => _scope._field._type.make()..name = name;

  /// A quick way to add a field into the model.
  ProtoMessageField operator [](ProtoMessageField idx) {
    return idx << name;
  }
}

class ProtoMessageScope extends Scope<ProtoMessage> {
  final ProtoMessageFieldScope _field;

  ProtoMessageScope(this._field);

  @override
  ProtoMessage make() => ProtoMessage(this).._fields = _field.none;

  ProtoMessage call(dynamic name, {ProtoMessageField fields}) {
    return add(name).._fields += fields;
  }

  ProtoMessage ofModels(Model models) {
    var res = none;

    for (final i in models.eval()) {
      res += ofFields(i.name, i.fields);
    }

    return res;
  }

  ProtoMessage ofFields(dynamic name, Field fields, [int position]) {
    return call(name, fields: _field.ofFields(fields, position ?? 0));
  }
}
