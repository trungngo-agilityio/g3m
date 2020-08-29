part of g3.stimpack.model.generated;



class StimModelType extends StimSymbol<StimModelType, StimModelTypeSet> {
  StimModelFieldSet fields;

  StimModelRuleSet rules;

  StimModelType(_StimModelTypeScopeImpl scope):
      super(scope);


  @override
  StimModelType clone() {
    return super.clone()
        ..fields = fields.clone()
        ..rules = rules.clone();
  }
}


class StimModelTypeSet extends StimSymbolSet<StimModelType, StimModelTypeSet> {
  final _StimModelModelImpl _pack;

  StimModelTypeXFieldsSetOp _fields;

  StimModelTypeXRulesSetOp _rules;

  StimModelTypeXFieldsSetOp get fields {
    return _fields ??= StimModelTypeXFieldsSetOp(this, _pack.field);
  }

  set fields(StimModelTypeXFieldsSetOp value) {
    _fields = value;
  }
  StimModelTypeXRulesSetOp get rules {
    return _rules ??= StimModelTypeXRulesSetOp(this, _pack.rule);
  }

  set rules(StimModelTypeXRulesSetOp value) {
    _rules = value;
  }
  StimModelTypeSet(this._pack, List<StimModelType> items):
      super(_pack._type, items);
}


abstract class StimModelTypeScope extends StimScope<StimModelType, StimModelTypeSet> {
  StimModelTypeSymbols get s;

  StimModelType of(name, {dynamic fields, dynamic rules});
}


class _StimModelTypeScopeImpl extends StimScopeImpl<StimModelType, StimModelTypeSet> implements StimModelTypeScope {
  final _StimModelModelImpl _pack;

  StimModelTypeSymbols _s;

  StimModelFieldSet fields;

  StimModelRuleSet rules;

  @override
  StimModelTypeSymbols get s {
    return _s ??= StimModelTypeSymbols(this);
  }
  _StimModelTypeScopeImpl(this._pack):
      super();


  @override
  StimModelType of(name, {dynamic fields, dynamic rules}) {
    return createAndClear(name)
        ..fields += fields ?? _pack.field.noneSet
        ..rules += rules ?? _pack.rule.noneSet;
  }

  @override
  void clear(StimModelType symbol) {
    symbol
        ..fields = _pack.field.noneSet
        ..rules = _pack.rule.noneSet;
  }

  @override
  StimModelType create() {
    return StimModelType(this);
  }

  @override
  StimModelTypeSet createSet(List<StimModelType> items) {
    return StimModelTypeSet(_pack, items);
  }
}


class StimModelTypeSymbols {
  StimModelTypeSet all;


  StimModelTypeSymbols(StimModelTypeScope scope) {
    all = scope.noneSet;
  }
}


class StimModelTypeGrpcPreset {
  StimModelTypeSet all;

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


  StimModelTypeGrpcPreset(StimModelTypeScope scope) {
    all = scope.noneSet;
    all += double = scope.of('double');
    all += float = scope.of('float');
    all += int32 = scope.of('int32');
    all += int64 = scope.of('int64');
    all += uint32 = scope.of('uint32');
    all += uint64 = scope.of('uint64');
    all += sint32 = scope.of('sint32');
    all += sint64 = scope.of('sint64');
    all += fixed32 = scope.of('fixed32');
    all += fixed64 = scope.of('fixed64');
    all += sfixed32 = scope.of('sfixed32');
    all += sfixed64 = scope.of('sfixed64');
    all += string = scope.of('string');
    all += bytes = scope.of('bytes');
  }
}


class StimModelTypeDatePreset {
  StimModelTypeSet all;

  StimModelType timestamp;

  StimModelType date;

  StimModelType time;

  StimModelType datetime;

  StimModelType localDate;

  StimModelType localTime;

  StimModelType localDatetime;


  StimModelTypeDatePreset(StimModelTypeScope scope) {
    all = scope.noneSet;
    all += timestamp = scope.of('timestamp');
    all += date = scope.of('date');
    all += time = scope.of('time');
    all += datetime = scope.of('datetime');
    all += localDate = scope.of('local date');
    all += localTime = scope.of('local time');
    all += localDatetime = scope.of('local datetime');
  }
}


class StimModelTypeAuthPreset {
  StimModelTypeSet all;

  StimModelType user;

  StimModelType userProfile;

  StimModelType accessToken;


  StimModelTypeAuthPreset(StimModelTypeScope scope) {
    all = scope.noneSet;
    all += user = scope.of('user');
    all += userProfile = scope.of('user profile');
    all += accessToken = scope.of('access token');
  }
}


class StimModelTypeCommonPreset {
  StimModelTypeSet all;

  StimModelType url;


  StimModelTypeCommonPreset(StimModelTypeScope scope) {
    all = scope.noneSet;
    all += url = scope.of('url');
  }
}
