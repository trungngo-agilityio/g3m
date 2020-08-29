part of g3.stimpack.grpc.generated;

class StimGrpcMessage extends StimSymbol<StimGrpcMessage, StimGrpcMessageSet > {
StimModelType type;

  StimGrpcMessage._(_StimGrpcMessageScopeImpl scope)
      : super(scope);

  @override
  StimGrpcMessage clone() {
    return super.clone()
      ..type = type.clone();    
  }
}

class StimGrpcMessageSet
    extends StimSymbolSet<StimGrpcMessage, StimGrpcMessageSet> {
  final _StimGrpcGrpcImpl __pack;

  
  StimGrpcMessageSet._(this.__pack, List<StimGrpcMessage> items)
      : super(__pack._message, items);

         
         
  StimGrpcMessageXTypeSetOp _type;

  StimGrpcMessageXTypeSetOp get type =>
      _type ??= StimGrpcMessageXTypeSetOp(this, __pack.type);

  set type(StimGrpcMessageXTypeSetOp value) => _type = value;
        
}

abstract class StimGrpcMessageScope
    extends StimScope<StimGrpcMessage, StimGrpcMessageSet> {
    
  StimGrpcMessageSymbols get s;
    
  StimGrpcMessage of(dynamic name, {dynamic type});
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

class _StimGrpcMessageScopeImpl 
    extends StimScopeImpl<StimGrpcMessage, StimGrpcMessageSet>
    implements StimGrpcMessageScope {
  final _StimGrpcGrpcImpl __pack;
  
  _StimGrpcMessageScopeImpl._(this.__pack) : super();

  StimGrpcMessageSymbols _s;

  @override
  StimGrpcMessageSymbols get s => _s ??= StimGrpcMessageSymbols(this);
  @override
  void clear(StimGrpcMessage symbol) {
    symbol
      ..type = __pack.type.none;    
  }

  @override
  StimGrpcMessage create() => StimGrpcMessage._(this);

  @override
  StimGrpcMessage of(dynamic name, {dynamic type}) {
    return createAndClear(name)
      ..type = type ?? __pack.type.none;    
  }

  @override
  StimGrpcMessageSet createSet(List<StimGrpcMessage> items) {
    return StimGrpcMessageSet._(__pack, items);
  }
}
    