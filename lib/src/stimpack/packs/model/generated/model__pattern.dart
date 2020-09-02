part of g3.stimpack.model.generated;

class StimModelPattern
    extends StimSymbol<StimModelPattern, StimModelPatternSet> {
  StimModelPattern(_StimModelPatternScopeImpl scope) : super(scope);

  @override
  StimModelPattern clone() {
    return super.clone();
  }
}

class StimModelPatternSet
    extends StimSymbolSet<StimModelPattern, StimModelPatternSet> {
  final _StimModelPatternScopeImpl _scope;

  StimModelPatternSet(this._scope, List<StimModelPattern> items)
      : super(_scope, items);
}

abstract class StimModelPatternScope
    extends StimScope<StimModelPattern, StimModelPatternSet> {
  StimModelPattern get id;

  StimModelPattern get uuidV4;

  StimModelPattern get slug;

  StimModelPattern get ipv4;

  StimModelPattern get ipv6;

  StimModelPattern get ip;

  StimModelPattern get url;

  StimModelPattern get email;

  StimModelPattern get username;

  StimModelPattern get password;

  StimModelPattern get phone;

  StimModelPattern get alpha;

  StimModelPattern of(name);
}

class _StimModelPatternScopeImpl
    extends StimScopeImpl<StimModelPattern, StimModelPatternSet>
    implements StimModelPatternScope {
  StimModelPattern _id;

  StimModelPattern _uuidV4;

  StimModelPattern _slug;

  StimModelPattern _ipv4;

  StimModelPattern _ipv6;

  StimModelPattern _ip;

  StimModelPattern _url;

  StimModelPattern _email;

  StimModelPattern _username;

  StimModelPattern _password;

  StimModelPattern _phone;

  StimModelPattern _alpha;

  @override
  StimModelPattern get id {
    return _id ??= of('id');
  }

  @override
  StimModelPattern get uuidV4 {
    return _uuidV4 ??= of('uuid v4');
  }

  @override
  StimModelPattern get slug {
    return _slug ??= of('slug');
  }

  @override
  StimModelPattern get ipv4 {
    return _ipv4 ??= of('ipv4');
  }

  @override
  StimModelPattern get ipv6 {
    return _ipv6 ??= of('ipv6');
  }

  @override
  StimModelPattern get ip {
    return _ip ??= of('ip');
  }

  @override
  StimModelPattern get url {
    return _url ??= of('url');
  }

  @override
  StimModelPattern get email {
    return _email ??= of('email');
  }

  @override
  StimModelPattern get username {
    return _username ??= of('username');
  }

  @override
  StimModelPattern get password {
    return _password ??= of('password');
  }

  @override
  StimModelPattern get phone {
    return _phone ??= of('phone');
  }

  @override
  StimModelPattern get alpha {
    return _alpha ??= of('alpha');
  }

  _StimModelPatternScopeImpl() : super();

  @override
  StimModelPattern of(name) {
    return createAndClear(name);
  }

  @override
  void clear(StimModelPattern symbol) {
    symbol;
  }

  @override
  StimModelPattern create() {
    return StimModelPattern(this);
  }

  @override
  StimModelPatternSet createSet(List<StimModelPattern> items) {
    return StimModelPatternSet(this, items);
  }
}
