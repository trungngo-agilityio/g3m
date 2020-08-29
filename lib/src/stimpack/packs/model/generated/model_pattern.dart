part of g3.stimpack.model.generated;



class StimModelPattern extends StimSymbol<StimModelPattern, StimModelPatternSet> {
  StimModelPattern(_StimModelPatternScopeImpl scope):
      super(scope);


  @override
  StimModelPattern clone() {
    return super.clone();
  }
}


class StimModelPatternSet extends StimSymbolSet<StimModelPattern, StimModelPatternSet> {
  final _StimModelPatternScopeImpl _scope;

  StimModelPatternSet(this._scope, List<StimModelPattern> items):
      super(_scope, items);
}


abstract class StimModelPatternScope extends StimScope<StimModelPattern, StimModelPatternSet> {
  StimModelPatternSymbols get s;

  StimModelPattern of(name);
}


class _StimModelPatternScopeImpl extends StimScopeImpl<StimModelPattern, StimModelPatternSet> implements StimModelPatternScope {
  StimModelPatternSymbols _s;

  @override
  StimModelPatternSymbols get s {
    return _s ??= StimModelPatternSymbols(this);
  }
  _StimModelPatternScopeImpl():
      super();


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


class StimModelPatternSymbols {
  StimModelPatternSet all;


  StimModelPatternSymbols(StimModelPatternScope scope) {
    all = scope.noneSet;
  }
}


class StimModelPatternValidationPreset {
  StimModelPatternSet all;

  StimModelPattern id;

  StimModelPattern uuidV4;

  StimModelPattern slug;

  StimModelPattern ipv4;

  StimModelPattern ipv6;

  StimModelPattern ip;

  StimModelPattern url;

  StimModelPattern email;

  StimModelPattern username;

  StimModelPattern password;

  StimModelPattern phone;

  StimModelPattern alpha;


  StimModelPatternValidationPreset(StimModelPatternScope scope) {
    all = scope.noneSet;
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
StimModelPatternValidationPreset  _extStimModelPatternValidationPreset;

extension StimModelPatternValidationPresetExtension on StimModelPatternScope {
  StimModelPatternValidationPreset get validation {
    return _extStimModelPatternValidationPreset ??= StimModelPatternValidationPreset(stimpack.model.pattern);
  }
}
    