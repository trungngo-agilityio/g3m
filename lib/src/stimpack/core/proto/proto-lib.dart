part of g3.stimpack.core;

/// A model has a set of [messages].
///
class ProtoLib extends Expr<ProtoLib> {
  @override
  final ProtoLibScope _scope;

  ProtoLib(this._scope) : super(_scope);

  // ---------------------------------------------------------------------------
  // ProtoMessages
  // ---------------------------------------------------------------------------
  ProtoMessage _messages;

  ProtoMessage get messages => _messages;

  set messages(ProtoMessage value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._messages = value;
    }
  }

  /// A model is valid when it has at least 1 field and all messages
  /// are valid.
  ///
  @override
  bool _isValid() => _messages.isNonEmptyValidSet;

  @override
  ProtoLib clone() => super.clone().._messages = _messages;
}

class ProtoLibScope extends Scope<ProtoLib> {
  final ProtoMessageScope _message;

  ProtoLibScope(this._message);

  @override
  ProtoLib make() => ProtoLib(this).._messages = _message.none;

  ProtoLib call(String name, {ProtoMessage messages}) {
    return add(name).._messages += messages;
  }
}
