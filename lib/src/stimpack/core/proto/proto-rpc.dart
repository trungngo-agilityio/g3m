part of g3.stimpack.core;

/// A model has a set of [fields].
///
class ProtoRpc extends Expr<ProtoRpc> {
  @override
  final ProtoRpcScope _scope;

  ProtoRpc(this._scope) : super(_scope);

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
  // Methods
  // ---------------------------------------------------------------------------
  ProtoRpcMethod _methods;

  ProtoRpcMethod get methods => _methods;

  set methods(ProtoRpcMethod value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._methods = value;
    }
  }

  @override
  ProtoRpc clone() => super.clone()
    .._lib = lib
    .._methods = _methods;
}

class ProtoRpcScope extends Scope<ProtoRpc> {
  final ProtoLibScope _lib;
  final ProtoRpcMethodScope _method;

  ProtoRpcScope(this._lib, this._method);

  @override
  ProtoRpc make() => ProtoRpc(this);

  ProtoRpc call(
    dynamic name, {
    ProtoLib lib,
    ProtoRpcMethod methods,
  }) {
    return add(name)
      .._lib = lib ?? _lib.none
      .._methods = methods ?? _method.none;
  }
}
