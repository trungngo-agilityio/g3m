part of g3.stimpack.grpc.generated;



class StimModelField extends StimSymbol<StimModelField, StimModelFieldSet> {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  StimModelField(_StimModelFieldScopeImpl scope):
      super(scope);


  @override
  StimModelField clone() {
    return super.clone()
        ..range = range.clone()
        ..patterns = patterns.clone();
  }
}


class StimModelFieldSet extends StimSymbolSet<StimModelField, StimModelFieldSet> {
  final _StimModelFieldScopeImpl _scope;

  StimModelFieldXRangeSetOp _range;

  StimModelFieldXPatternsSetOp _patterns;

  StimModelFieldXRangeSetOp get range {
    return _range ??= StimModelFieldXRangeSetOp(this, stimpack.model.range);
  }

  set range(StimModelFieldXRangeSetOp value) {
    _range = value;
  }
  StimModelFieldXPatternsSetOp get patterns {
    return _patterns ??= StimModelFieldXPatternsSetOp(this, stimpack.model.pattern);
  }

  set patterns(StimModelFieldXPatternsSetOp value) {
    _patterns = value;
  }
  StimModelFieldSet(this._scope, List<StimModelField> items):
      super(_scope, items);
}


abstract class StimModelFieldScope extends StimScope<StimModelField, StimModelFieldSet> {
  StimModelField of(name, {dynamic range, dynamic patterns});
}


class _StimModelFieldScopeImpl extends StimScopeImpl<StimModelField, StimModelFieldSet> implements StimModelFieldScope {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  _StimModelFieldScopeImpl():
      super();


  @override
  StimModelField of(name, {dynamic range, dynamic patterns}) {
    return createAndClear(name)
        ..range += range ?? stimpack.model.range.noneSet
        ..patterns += patterns ?? stimpack.model.pattern.noneSet;
  }

  @override
  void clear(StimModelField symbol) {
    symbol
        ..range = stimpack.model.range.noneSet
        ..patterns = stimpack.model.pattern.noneSet;
  }

  @override
  StimModelField create() {
    return StimModelField(this);
  }

  @override
  StimModelFieldSet createSet(List<StimModelField> items) {
    return StimModelFieldSet(this, items);
  }
}
