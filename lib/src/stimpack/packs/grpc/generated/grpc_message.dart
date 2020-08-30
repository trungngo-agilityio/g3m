part of g3.stimpack.grpc.generated;



class StimGrpcMessage extends StimSymbol<StimGrpcMessage, StimGrpcMessageSet> {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  StimModelType type;

  StimGrpcMessage(_StimGrpcMessageScopeImpl scope):
      super(scope);


  @override
  StimGrpcMessage clone() {
    return super.clone()
        ..range = range.clone()
        ..patterns = patterns.clone()
        ..type = type.clone();
  }
}


class StimGrpcMessageSet extends StimSymbolSet<StimGrpcMessage, StimGrpcMessageSet> {
  final _StimGrpcMessageScopeImpl _scope;

  StimGrpcMessageXRangeSetOp _range;

  StimGrpcMessageXPatternsSetOp _patterns;

  StimGrpcMessageXTypeOp _type;

  StimGrpcMessageXRangeSetOp get range {
    return _range ??= StimGrpcMessageXRangeSetOp(this, stimpack.model.range);
  }

  set range(StimGrpcMessageXRangeSetOp value) {
    _range = value;
  }
  StimGrpcMessageXPatternsSetOp get patterns {
    return _patterns ??= StimGrpcMessageXPatternsSetOp(this, stimpack.model.pattern);
  }

  set patterns(StimGrpcMessageXPatternsSetOp value) {
    _patterns = value;
  }
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
  StimGrpcMessage of(name, {dynamic range, dynamic patterns, dynamic type});
}


class _StimGrpcMessageScopeImpl extends StimScopeImpl<StimGrpcMessage, StimGrpcMessageSet> implements StimGrpcMessageScope {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  StimModelType type;

  _StimGrpcMessageScopeImpl():
      super();


  @override
  StimGrpcMessage of(name, {dynamic range, dynamic patterns, dynamic type}) {
    return createAndClear(name)
        ..range += range ?? stimpack.model.range.noneSet
        ..patterns += patterns ?? stimpack.model.pattern.noneSet
        ..type = type ?? stimpack.model.type.none;
  }

  @override
  void clear(StimGrpcMessage symbol) {
    symbol
        ..range = stimpack.model.range.noneSet
        ..patterns = stimpack.model.pattern.noneSet
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
