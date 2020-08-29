part of g3.stimpack.model.generated;

class StimModelPattern extends StimSymbol<StimModelPattern, StimModelPatternSet > {


  StimModelPattern._(_StimModelPatternScopeImpl scope)
      : super(scope);

  @override
  StimModelPattern clone() {
    return super.clone()
;    
  }
}

class StimModelPatternSet
    extends StimSymbolSet<StimModelPattern, StimModelPatternSet> {
  final _StimModelModelImpl __pack;

  
  StimModelPatternSet._(this.__pack, List<StimModelPattern> items)
      : super(__pack._pattern, items);


}

abstract class StimModelPatternScope
    extends StimScope<StimModelPattern, StimModelPatternSet> {
    
  StimModelPatternSymbols get s;
    
  StimModelPattern of(dynamic name);
}


class StimModelPatternValidationPreset {
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

  StimModelPatternSet all;


  StimModelPatternValidationPreset(StimModelPatternScope scope) {
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

        
class StimModelPatternSymbols {
  final _StimModelPatternScopeImpl _scope;
  /// All symbols
  StimModelPatternSet all;
  StimModelPatternValidationPreset _validation;

  StimModelPatternValidationPreset get validation {
    return _validation ??= StimModelPatternValidationPreset(_scope);
  }
  
  StimModelPatternSymbols(this._scope) {
    final _s = stimpack.model.pattern;
    all = _s.noneSet;

  }
}

class _StimModelPatternScopeImpl 
    extends StimScopeImpl<StimModelPattern, StimModelPatternSet>
    implements StimModelPatternScope {
  final _StimModelModelImpl __pack;
  
  _StimModelPatternScopeImpl._(this.__pack) : super();

  StimModelPatternSymbols _s;

  @override
  StimModelPatternSymbols get s => _s ??= StimModelPatternSymbols(this);
  @override
  void clear(StimModelPattern symbol) {
    
  }

  @override
  StimModelPattern create() => StimModelPattern._(this);

  @override
  StimModelPattern of(dynamic name) {
    return createAndClear(name)
;    
  }

  @override
  StimModelPatternSet createSet(List<StimModelPattern> items) {
    return StimModelPatternSet._(__pack, items);
  }
}
    