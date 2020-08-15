part of g3m.core;

class ProtoRpcMethod extends Expr<ProtoRpcMethod> {
  @override
  final ProtoRpcMethodScope _scope;

  ProtoRpcMethod(this._scope) : super(_scope);

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
  // Request streamed?
  // ---------------------------------------------------------------------------
  bool _requestStreamed;

  bool get requestStreamed => _requestStreamed;

  set requestStreamed(value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._requestStreamed = value;
    }
  }

  // ---------------------------------------------------------------------------
  // ProtoMessage
  // ---------------------------------------------------------------------------
  ProtoMessage _request;

  ProtoMessage get request => _request;

  set request(value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._request = value;
    }
  }

  // ---------------------------------------------------------------------------
  // Response streamed?
  // ---------------------------------------------------------------------------
  bool _responseStreamed;

  bool get responseStreamed => _responseStreamed;

  set responseStreamed(value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._responseStreamed = value;
    }
  }

  // ---------------------------------------------------------------------------
  // ProtoMessage
  // ---------------------------------------------------------------------------
  ProtoMessage _response;

  ProtoMessage get response => _response;

  set response(value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._response = value;
    }
  }

  /// A model is valid when it has at least 1 field and all fields
  /// are valid.
  ///
  @override
  bool _isValid() {
    assert(_requestStreamed != null);
    assert(_responseStreamed != null);

    return _lib.isValidSingle &&
        (_request.isEmptySet || _request.isValidSingle) &&
        (_response.isEmptySet || _response.isValidSingle);
  }

  @override
  ProtoRpcMethod clone() => super.clone()
    .._lib = lib
    .._requestStreamed = _requestStreamed
    .._request = _request
    .._responseStreamed = _responseStreamed
    .._response = _response;
}

class ProtoRpcMethodScope extends Scope<ProtoRpcMethod> {
  final ProtoLibScope _lib;
  final ProtoMessageScope _message;

  ProtoRpcMethodScope(this._lib, this._message);

  @override
  ProtoRpcMethod make() => ProtoRpcMethod(this)
    .._request = _message.none
    .._response = _message.none;

  ProtoRpcMethod call(
    dynamic name, {
    ProtoLib lib,
    bool requestStreamed = false,
    ProtoMessage request,
    bool responseStreamed = false,
    ProtoMessage response,
  }) {
    return add(name)
      .._lib = lib ?? _lib.none
      .._requestStreamed = requestStreamed
      .._request = request ?? _message.none
      .._responseStreamed = responseStreamed
      .._response = response ?? _message.none;
  }
}
