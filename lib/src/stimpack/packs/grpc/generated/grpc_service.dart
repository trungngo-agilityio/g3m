part of g3.stimpack.grpc.generated;



class StimGrpcService extends StimSymbol<StimGrpcService, StimGrpcServiceSet> {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  StimGrpcMethodSet methods;

  StimGrpcService(_StimGrpcServiceScopeImpl scope):
      super(scope);


  @override
  StimGrpcService clone() {
    return super.clone()
        ..range = range.clone()
        ..patterns = patterns.clone()
        ..methods = methods.clone();
  }
}


class StimGrpcServiceSet extends StimSymbolSet<StimGrpcService, StimGrpcServiceSet> {
  final _StimGrpcServiceScopeImpl _scope;

  StimGrpcServiceXRangeSetOp _range;

  StimGrpcServiceXPatternsSetOp _patterns;

  StimGrpcServiceXMethodsSetOp _methods;

  StimGrpcServiceXRangeSetOp get range {
    return _range ??= StimGrpcServiceXRangeSetOp(this, stimpack.model.range);
  }

  set range(StimGrpcServiceXRangeSetOp value) {
    _range = value;
  }
  StimGrpcServiceXPatternsSetOp get patterns {
    return _patterns ??= StimGrpcServiceXPatternsSetOp(this, stimpack.model.pattern);
  }

  set patterns(StimGrpcServiceXPatternsSetOp value) {
    _patterns = value;
  }
  StimGrpcServiceXMethodsSetOp get methods {
    return _methods ??= StimGrpcServiceXMethodsSetOp(this, stimpack.grpc.method);
  }

  set methods(StimGrpcServiceXMethodsSetOp value) {
    _methods = value;
  }
  StimGrpcServiceSet(this._scope, List<StimGrpcService> items):
      super(_scope, items);
}


abstract class StimGrpcServiceScope extends StimScope<StimGrpcService, StimGrpcServiceSet> {
  StimGrpcService of(name, {dynamic range, dynamic patterns, dynamic methods});
}


class _StimGrpcServiceScopeImpl extends StimScopeImpl<StimGrpcService, StimGrpcServiceSet> implements StimGrpcServiceScope {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  StimGrpcMethodSet methods;

  _StimGrpcServiceScopeImpl():
      super();


  @override
  StimGrpcService of(name, {dynamic range, dynamic patterns, dynamic methods}) {
    return createAndClear(name)
        ..range += range ?? stimpack.model.range.noneSet
        ..patterns += patterns ?? stimpack.model.pattern.noneSet
        ..methods += methods ?? stimpack.grpc.method.noneSet;
  }

  @override
  void clear(StimGrpcService symbol) {
    symbol
        ..range = stimpack.model.range.noneSet
        ..patterns = stimpack.model.pattern.noneSet
        ..methods = stimpack.grpc.method.noneSet;
  }

  @override
  StimGrpcService create() {
    return StimGrpcService(this);
  }

  @override
  StimGrpcServiceSet createSet(List<StimGrpcService> items) {
    return StimGrpcServiceSet(this, items);
  }
}
