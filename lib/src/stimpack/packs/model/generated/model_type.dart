part of g3.stimpack.model.generated;

class StimModelType extends StimSymbol<StimModelType, StimModelTypeSet > {
  StimModelFieldSet fields;
  StimModelRuleSet rules;

  StimModelType._(_StimModelTypeScopeImpl scope)
      : super(scope);

  @override
  StimModelType clone() {
    return super.clone()
      ..fields = fields.clone()
      ..rules = rules.clone();    
  }
}

class StimModelTypeSet
    extends StimSymbolSet<StimModelType, StimModelTypeSet> {
  final _StimModelModelImpl __pack;

  
  StimModelTypeSet._(this.__pack, List<StimModelType> items)
      : super(__pack._type, items);

        
        
  StimModelTypeXFieldsSetOp _fields;

  StimModelTypeXFieldsSetOp get field =>
      _fields ??= StimModelTypeXFieldsSetOp(this, __pack.field);

  set fields(StimModelTypeXFieldsSetOp value) => _fields = value;
                
        
  StimModelTypeXRulesSetOp _rules;

  StimModelTypeXRulesSetOp get rule =>
      _rules ??= StimModelTypeXRulesSetOp(this, __pack.rule);

  set rules(StimModelTypeXRulesSetOp value) => _rules = value;
        
}

abstract class StimModelTypeScope
    extends StimScope<StimModelType, StimModelTypeSet> {
    
  StimModelTypeSymbols get s;
    
  StimModelType of(dynamic name, {dynamic fields, dynamic rules});
}


class StimModelTypeGrpcPreset {
  StimModelType double;

  StimModelType float;

  StimModelType int32;

  StimModelType int64;

  StimModelType uint32;

  StimModelType uint64;

  StimModelType sint32;

  StimModelType sint64;

  StimModelType fixed32;

  StimModelType fixed64;

  StimModelType sfixed32;

  StimModelType sfixed64;

  StimModelType string;

  StimModelType bytes;

  StimModelTypeSet all;


  StimModelTypeGrpcPreset(StimModelTypeScope scope) {
    double = scope.of('double');
    float = scope.of('float');
    int32 = scope.of('int32');
    int64 = scope.of('int64');
    uint32 = scope.of('uint32');
    uint64 = scope.of('uint64');
    sint32 = scope.of('sint32');
    sint64 = scope.of('sint64');
    fixed32 = scope.of('fixed32');
    fixed64 = scope.of('fixed64');
    sfixed32 = scope.of('sfixed32');
    sfixed64 = scope.of('sfixed64');
    string = scope.of('string');
    bytes = scope.of('bytes');
  }
}

class StimModelTypeDatePreset {
  StimModelType timestamp;

  StimModelType date;

  StimModelType time;

  StimModelType datetime;

  StimModelType localDate;

  StimModelType localTime;

  StimModelType localDatetime;

  StimModelTypeSet all;


  StimModelTypeDatePreset(StimModelTypeScope scope) {
    timestamp = scope.of('timestamp');
    date = scope.of('date');
    time = scope.of('time');
    datetime = scope.of('datetime');
    localDate = scope.of('local date');
    localTime = scope.of('local time');
    localDatetime = scope.of('local datetime');
  }
}

class StimModelTypeAuthPreset {
  StimModelType user;

  StimModelType userProfile;

  StimModelType accessToken;

  StimModelTypeSet all;


  StimModelTypeAuthPreset(StimModelTypeScope scope) {
    user = scope.of('user');
    userProfile = scope.of('user profile');
    accessToken = scope.of('access token');
  }
}

class StimModelTypeCommonPreset {
  StimModelType url;

  StimModelTypeSet all;


  StimModelTypeCommonPreset(StimModelTypeScope scope) {
    url = scope.of('url');
  }
}

        
class StimModelTypeSymbols {
  final _StimModelTypeScopeImpl _scope;
  /// All symbols
  StimModelTypeSet all;
  StimModelTypeGrpcPreset _grpc;

  StimModelTypeGrpcPreset get grpc {
    return _grpc ??= StimModelTypeGrpcPreset(_scope);
  }
  StimModelTypeDatePreset _date;

  StimModelTypeDatePreset get date {
    return _date ??= StimModelTypeDatePreset(_scope);
  }
  StimModelTypeAuthPreset _auth;

  StimModelTypeAuthPreset get auth {
    return _auth ??= StimModelTypeAuthPreset(_scope);
  }
  StimModelTypeCommonPreset _common;

  StimModelTypeCommonPreset get common {
    return _common ??= StimModelTypeCommonPreset(_scope);
  }
  
  StimModelTypeSymbols(this._scope) {
    final _s = stimpack.model.type;
    all = _s.noneSet;

  }
}

class _StimModelTypeScopeImpl 
    extends StimScopeImpl<StimModelType, StimModelTypeSet>
    implements StimModelTypeScope {
  final _StimModelModelImpl __pack;
  
  _StimModelTypeScopeImpl._(this.__pack) : super();

  StimModelTypeSymbols _s;

  @override
  StimModelTypeSymbols get s => _s ??= StimModelTypeSymbols(this);
  @override
  void clear(StimModelType symbol) {
    symbol
      ..fields = __pack.field.noneSet
      ..rules = __pack.rule.noneSet;    
  }

  @override
  StimModelType create() => StimModelType._(this);

  @override
  StimModelType of(dynamic name, {dynamic fields, dynamic rules}) {
    return createAndClear(name)
      ..fields += fields ?? __pack.field.noneSet
      ..rules += rules ?? __pack.rule.noneSet;    
  }

  @override
  StimModelTypeSet createSet(List<StimModelType> items) {
    return StimModelTypeSet._(__pack, items);
  }
}
    