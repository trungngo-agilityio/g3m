part of g3.stimpack.model.generated;



class StimModelRule extends StimSymbol<StimModelRule, StimModelRuleSet> {
  StimModelRangeSet range;

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

  StimModelRuleXRangeSetOp _range;

  StimModelRuleXPatternsSetOp _patterns;

  StimModelRuleXRangeSetOp get range {
    return _range ??= StimModelRuleXRangeSetOp(this, stimpack.model.range);
  }

  set range(StimModelRuleXRangeSetOp value) {
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
  StimModelRule get id;
  StimModelRule get uuidV4;
  StimModelRule get slug;
  StimModelRule get ipv4;
  StimModelRule get ipv6;
  StimModelRule get ip;
  StimModelRule get url;
  StimModelRule get email;
  StimModelRule get username;
  StimModelRule get password;
  StimModelRule get phone;
  StimModelRule get alpha;
  StimModelRule get unique;
  StimModelRule get required;
  StimModelRule get text;
  StimModelRule get desc;
  StimModelRule get longText;
  StimModelRule get shortText;

  StimModelRule of(name, {dynamic range, dynamic patterns});
}


class _StimModelRuleScopeImpl extends StimScopeImpl<StimModelRule, StimModelRuleSet> implements StimModelRuleScope {
  StimModelRule _id;

  StimModelRule _uuidV4;

  StimModelRule _slug;

  StimModelRule _ipv4;

  StimModelRule _ipv6;

  StimModelRule _ip;

  StimModelRule _url;

  StimModelRule _email;

  StimModelRule _username;

  StimModelRule _password;

  StimModelRule _phone;

  StimModelRule _alpha;

  StimModelRule _unique;

  StimModelRule _required;

  StimModelRule _text;

  StimModelRule _desc;

  StimModelRule _longText;

  StimModelRule _shortText;

  StimModelRangeSet range;

  StimModelPatternSet patterns;

  @override
  StimModelRule get id {
    return _id ??= of('id');
  }
  @override
  StimModelRule get uuidV4 {
    return _uuidV4 ??= of('uuid v4');
  }
  @override
  StimModelRule get slug {
    return _slug ??= of('slug');
  }
  @override
  StimModelRule get ipv4 {
    return _ipv4 ??= of('ipv4');
  }
  @override
  StimModelRule get ipv6 {
    return _ipv6 ??= of('ipv6');
  }
  @override
  StimModelRule get ip {
    return _ip ??= of('ip');
  }
  @override
  StimModelRule get url {
    return _url ??= of('url');
  }
  @override
  StimModelRule get email {
    return _email ??= of('email');
  }
  @override
  StimModelRule get username {
    return _username ??= of('username');
  }
  @override
  StimModelRule get password {
    return _password ??= of('password');
  }
  @override
  StimModelRule get phone {
    return _phone ??= of('phone');
  }
  @override
  StimModelRule get alpha {
    return _alpha ??= of('alpha');
  }
  @override
  StimModelRule get unique {
    return _unique ??= of('unique');
  }
  @override
  StimModelRule get required {
    return _required ??= of('required');
  }
  @override
  StimModelRule get text {
    return _text ??= of('text');
  }
  @override
  StimModelRule get desc {
    return _desc ??= of('desc');
  }
  @override
  StimModelRule get longText {
    return _longText ??= of('long text');
  }
  @override
  StimModelRule get shortText {
    return _shortText ??= of('short text');
  }
  _StimModelRuleScopeImpl():
      super();


  @override
  StimModelRule of(name, {dynamic range, dynamic patterns}) {
    return createAndClear(name)
        ..range += range ?? stimpack.model.range.noneSet
        ..patterns += patterns ?? stimpack.model.pattern.noneSet;
  }

  @override
  void clear(StimModelRule symbol) {
    symbol
        ..range = stimpack.model.range.noneSet
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
