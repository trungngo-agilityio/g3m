part of g3.stimpack.model.generated;

class StimModelRule extends StimSymbol<StimModelRule, StimModelRuleSet > {
  StimModelRange range;
  StimModelPatternSet patterns;

  StimModelRule._(_StimModelRuleScopeImpl scope)
      : super(scope);

  @override
  StimModelRule clone() {
    return super.clone()
      ..range = range.clone()
      ..patterns = patterns.clone();    
  }
}

class StimModelRuleSet
    extends StimSymbolSet<StimModelRule, StimModelRuleSet> {
  final _StimModelModelImpl __pack;

  
  StimModelRuleSet._(this.__pack, List<StimModelRule> items)
      : super(__pack._rule, items);

         
         
  StimModelRuleXRangeSetOp _range;

  StimModelRuleXRangeSetOp get range =>
      _range ??= StimModelRuleXRangeSetOp(this, __pack.range);

  set range(StimModelRuleXRangeSetOp value) => _range = value;
                
        
  StimModelRuleXPatternsSetOp _patterns;

  StimModelRuleXPatternsSetOp get pattern =>
      _patterns ??= StimModelRuleXPatternsSetOp(this, __pack.pattern);

  set patterns(StimModelRuleXPatternsSetOp value) => _patterns = value;
        
}

abstract class StimModelRuleScope
    extends StimScope<StimModelRule, StimModelRuleSet> {
    
  StimModelRuleSymbols get s;
    
  StimModelRule of(dynamic name, {dynamic range, dynamic patterns});
}


class StimModelRuleValidationPreset {
  StimModelRule text;

  StimModelRule desc;

  StimModelRule longText;

  StimModelRule shortText;

  StimModelRule id;

  StimModelRule uuidV4;

  StimModelRule slug;

  StimModelRule ipv4;

  StimModelRule ipv6;

  StimModelRule ip;

  StimModelRule url;

  StimModelRule email;

  StimModelRule username;

  StimModelRule password;

  StimModelRule phone;

  StimModelRule alpha;

  StimModelRuleSet all;


  StimModelRuleValidationPreset(StimModelRuleScope scope) {
    text = scope.of('text');
    desc = scope.of('desc');
    longText = scope.of('long text');
    shortText = scope.of('short text');
    id = scope.of('id');
    uuidV4 = scope.of('uuid v4');
    slug = scope.of('slug');
    ipv4 = scope.of('ipv4');
    ipv6 = scope.of('ipv6');
    ip = scope.of('ip');
    url = scope.of('url');
    email = scope.of('email');
    username = scope.of('username');
    password = scope.of('password');
    phone = scope.of('phone');
    alpha = scope.of('alpha');
  }
}

        
class StimModelRuleSymbols {
  final _StimModelRuleScopeImpl _scope;
  /// All symbols
  StimModelRuleSet all;
  StimModelRuleValidationPreset _validation;

  StimModelRuleValidationPreset get validation {
    return _validation ??= StimModelRuleValidationPreset(_scope);
  }
    StimModelRule unique;
    StimModelRule required;
  
  StimModelRuleSymbols(this._scope) {
    final _s = stimpack.model.rule;
    all = _s.noneSet;
    all += unique = _scope.of('unique');
    all += required = _scope.of('required');
  }
}

class _StimModelRuleScopeImpl 
    extends StimScopeImpl<StimModelRule, StimModelRuleSet>
    implements StimModelRuleScope {
  final _StimModelModelImpl __pack;
  
  _StimModelRuleScopeImpl._(this.__pack) : super();

  StimModelRuleSymbols _s;

  @override
  StimModelRuleSymbols get s => _s ??= StimModelRuleSymbols(this);
  @override
  void clear(StimModelRule symbol) {
    symbol
      ..range = __pack.range.none
      ..patterns = __pack.pattern.noneSet;    
  }

  @override
  StimModelRule create() => StimModelRule._(this);

  @override
  StimModelRule of(dynamic name, {dynamic range, dynamic patterns}) {
    return createAndClear(name)
      ..range = range ?? __pack.range.none
      ..patterns += patterns ?? __pack.pattern.noneSet;    
  }

  @override
  StimModelRuleSet createSet(List<StimModelRule> items) {
    return StimModelRuleSet._(__pack, items);
  }
}
    