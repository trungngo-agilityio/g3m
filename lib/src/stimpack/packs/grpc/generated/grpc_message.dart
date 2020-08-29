part of g3.stimpack.grpc.generated;



class StimGrpcMessage extends StimSymbol<StimGrpcMessage, StimGrpcMessageSet> {
  StimModelType type;

  StimGrpcMessage(_StimGrpcMessageScopeImpl scope):
      super(scope);


  @override
  StimGrpcMessage clone() {
    return super.clone()
        ..type = type.clone();
  }
}


class StimGrpcMessageSet extends StimSymbolSet<StimGrpcMessage, StimGrpcMessageSet> {
  final _StimGrpcGrpcImpl _pack;

  StimGrpcMessageXTypeOp _type;

  StimGrpcMessageXTypeOp get type {
    return _type ??= StimGrpcMessageXTypeOp(this, _pack.type);
  }

  set type(StimGrpcMessageXTypeOp value) {
    _type = value;
  }
  StimGrpcMessageSet(this._pack, List<StimGrpcMessage> items):
      super(_pack._message, items);
}


abstract class StimGrpcMessageScope extends StimScope<StimGrpcMessage, StimGrpcMessageSet> {
  StimGrpcMessageSymbols get s;

  StimGrpcMessage of(name, {dynamic type});
}


class _StimGrpcMessageScopeImpl extends StimScopeImpl<StimGrpcMessage, StimGrpcMessageSet> implements StimGrpcMessageScope {
  final _StimGrpcGrpcImpl _pack;

  StimGrpcMessageSymbols _s;

  StimModelType type;

  @override
  StimGrpcMessageSymbols get s {
    return _s ??= StimGrpcMessageSymbols(this);
  }
  _StimGrpcMessageScopeImpl(this._pack):
      super();


  @override
  StimGrpcMessage of(name, {dynamic type}) {
    return createAndClear(name)
        ..type += type ?? _pack.type.none;
  }

  @override
  void clear(StimGrpcMessage symbol) {
    symbol
        ..type = _pack.type.none;
  }

  @override
  StimGrpcMessage create() {
    return StimGrpcMessage(this);
  }

  @override
  StimGrpcMessageSet createSet(List<StimGrpcMessage> items) {
    return StimGrpcMessageSet(_pack, items);
  }
}

        
class StimGrpcMessageSymbols {
  final _StimGrpcMessageScopeImpl _scope;
  /// All symbols
  StimGrpcMessageSet all;

  
  StimGrpcMessageSymbols(this._scope) {
    final _s = stimpack.grpc.message;
    all = _s.noneSet;

  }
}

