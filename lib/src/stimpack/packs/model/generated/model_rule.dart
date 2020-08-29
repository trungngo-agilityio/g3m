part of g3.stimpack.model.generated;



class StimModelRule extends StimSymbol<StimModelRule, StimModelRuleSet> {
  StimModelRange range;

  StimModelPatternSet patterns;

  StimModelRule(_StimModelRuleScopeImpl scope):
      super(scope);


  @override
  StimModelRule clone() {
    return super.clone()
        ..range = range.clone()
        ..patterns = patterns.clone();
  }
}


class StimModelRuleSet extends StimSymbolSet<StimModelRule, StimModelRuleSet> {
  final _StimModelRuleScopeImpl _scope;

  StimModelRuleXRangeOp _range;

  StimModelRuleXPatternsSetOp _patterns;

  StimModelRuleXRangeOp get range {
    return _range ??= StimModelRuleXRangeOp(this, stimpack.model.range);
  }

  set range(StimModelRuleXRangeOp value) {
    _range = value;
  }
  StimModelRuleXPatternsSetOp get patterns {
    return _patterns ??= StimModelRuleXPatternsSetOp(this, stimpack.model.pattern);
  }

  set patterns(StimModelRuleXPatternsSetOp value) {
    _patterns = value;
  }
  StimModelRuleSet(this._scope, List<StimModelRule> items):
      super(_scope, items);
}


abstract class StimModelRuleScope extends StimScope<StimModelRule, StimModelRuleSet> {
  StimModelRuleSymbols get s;

  StimModelRule of(name, {dynamic range, dynamic patterns});
}


class _StimModelRuleScopeImpl extends StimScopeImpl<StimModelRule, StimModelRuleSet> implements StimModelRuleScope {
  StimModelRuleSymbols _s;

  StimModelRange range;

  StimModelPatternSet patterns;

  @override
  StimModelRuleSymbols get s {
    return _s ??= StimModelRuleSymbols(this);
  }
  _StimModelRuleScopeImpl():
      super();


  @override
  StimModelRule of(name, {dynamic range, dynamic patterns}) {
    return createAndClear(name)
        ..range = range ?? stimpack.model.range.none
        ..patterns += patterns ?? stimpack.model.pattern.noneSet;
  }

  @override
  void clear(StimModelRule symbol) {
    symbol
        ..range = stimpack.model.range.none
        ..patterns = stimpack.model.pattern.noneSet;
  }

  @override
  StimModelRule create() {
    return StimModelRule(this);
  }

  @override
  StimModelRuleSet createSet(List<StimModelRule> items) {
    return StimModelRuleSet(this, items);
  }
}


class StimModelRuleSymbols {
  StimModelRuleSet all;

  StimModelRule unique;

  StimModelRule required;


  StimModelRuleSymbols(StimModelRuleScope scope) {
    all = scope.noneSet;
    all += unique = scope.of('unique');
    all += required = scope.of('required');
  }
}


class StimModelRuleValidationPreset {
  StimModelRuleSet all;

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


  StimModelRuleValidationPreset(StimModelRuleScope scope) {
    all = scope.noneSet;
    all += text = scope.of('text');
    all += desc = scope.of('desc');
    all += longText = scope.of('long text');
    all += shortText = scope.of('short text');
    all += id = scope.of('id');
    all += uuidV4 = scope.of('uuid v4');
    all += slug = scope.of('slug');
    all += ipv4 = scope.of('ipv4');
    all += ipv6 = scope.of('ipv6');
    all += ip = scope.of('ip');
    all += url = scope.of('url');
    all += email = scope.of('email');
    all += username = scope.of('username');
    all += password = scope.of('password');
    all += phone = scope.of('phone');
    all += alpha = scope.of('alpha');
  }
}
StimModelRuleDefaultPreset  _extStimModelRuleDefaultPreset;

extension StimModelRuleDefaultPresetExtension on StimModelRuleScope {
  StimModelRuleDefaultPreset get  {
    return _extStimModelRuleDefaultPreset ??= StimModelRuleDefaultPreset(stimpack.model.rule);
  }
}
    
StimModelRuleValidationPreset  _extStimModelRuleValidationPreset;

extension StimModelRuleValidationPresetExtension on StimModelRuleScope {
  StimModelRuleValidationPreset get validation {
    return _extStimModelRuleValidationPreset ??= StimModelRuleValidationPreset(stimpack.model.rule);
  }
}
    