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
  final _StimGrpcMessageScopeImpl _scope;

  StimGrpcMessageXTypeOp _type;

  StimGrpcMessageXTypeOp get type {
    return _type ??= StimGrpcMessageXTypeOp(this, stimpack.model.type);
  }

  set type(StimGrpcMessageXTypeOp value) {
    _type = value;
  }
  StimGrpcMessageSet(this._scope, List<StimGrpcMessage> items):
      super(_scope, items);
}


abstract class StimGrpcMessageScope extends StimScope<StimGrpcMessage, StimGrpcMessageSet> {
  StimGrpcMessageSymbols get s;

  StimGrpcMessage of(name, {dynamic type});
}


class _StimGrpcMessageScopeImpl extends StimScopeImpl<StimGrpcMessage, StimGrpcMessageSet> implements StimGrpcMessageScope {
  StimGrpcMessageSymbols _s;

  StimModelType type;

  @override
  StimGrpcMessageSymbols get s {
    return _s ??= StimGrpcMessageSymbols(this);
  }
  _StimGrpcMessageScopeImpl():
      super();


  @override
  StimGrpcMessage of(name, {dynamic type}) {
    return createAndClear(name)
        ..type = type ?? stimpack.model.type.none;
  }

  @override
  void clear(StimGrpcMessage symbol) {
    symbol
        ..type = stimpack.model.type.none;
  }

  @override
  StimGrpcMessage create() {
    return StimGrpcMessage(this);
  }

  @override
  StimGrpcMessageSet createSet(List<StimGrpcMessage> items) {
    return StimGrpcMessageSet(this, items);
  }
}


class StimGrpcMessageSymbols {
  StimGrpcMessageSet all;


  StimGrpcMessageSymbols(StimGrpcMessageScope scope) {
    all = scope.noneSet;
  }
}
