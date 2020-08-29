part of g3.stimpack.model.generated;

class StimModelRange extends StimSymbol<StimModelRange, StimModelRangeSet > {


  StimModelRange._(_StimModelRangeScopeImpl scope)
      : super(scope);

  @override
  StimModelRange clone() {
    return super.clone()
;    
  }
}

class StimModelRangeSet
    extends StimSymbolSet<StimModelRange, StimModelRangeSet> {
  final _StimModelModelImpl __pack;

  
  StimModelRangeSet._(this.__pack, List<StimModelRange> items)
      : super(__pack._range, items);


}

abstract class StimModelRangeScope
    extends StimScope<StimModelRange, StimModelRangeSet> {
    
  StimModelRangeSymbols get s;
    
  StimModelRange of(dynamic name);
}


        
class StimModelRangeSymbols {
  final _StimModelRangeScopeImpl _scope;
  /// All symbols
  StimModelRangeSet all;

  
  StimModelRangeSymbols(this._scope) {
    final _s = stimpack.model.range;
    all = _s.noneSet;

  }
}

class _StimModelRangeScopeImpl 
    extends StimScopeImpl<StimModelRange, StimModelRangeSet>
    implements StimModelRangeScope {
  final _StimModelModelImpl __pack;
  
  _StimModelRangeScopeImpl._(this.__pack) : super();

  StimModelRangeSymbols _s;

  @override
  StimModelRangeSymbols get s => _s ??= StimModelRangeSymbols(this);
  @override
  void clear(StimModelRange symbol) {
    
  }

  @override
  StimModelRange create() => StimModelRange._(this);

  @override
  StimModelRange of(dynamic name) {
    return createAndClear(name)
;    
  }

  @override
  StimModelRangeSet createSet(List<StimModelRange> items) {
    return StimModelRangeSet._(__pack, items);
  }
}
    