part of g3.stimpack.model.generated;



class StimModelType extends StimSymbol<StimModelType, StimModelTypeSet> {
  StimModelTypeSet mixins;

  StimModelFieldSet fields;

  StimModelRuleSet rules;

  StimModelType(_StimModelTypeScopeImpl scope):
      super(scope);


  @override
  StimModelType clone() {
    return super.clone()
        ..mixins = mixins.clone()
        ..fields = fields.clone()
        ..rules = rules.clone();
  }
}


class StimModelTypeSet extends StimSymbolSet<StimModelType, StimModelTypeSet> {
  final _StimModelTypeScopeImpl _scope;

  StimModelTypeXMixinsSetOp _mixins;

  StimModelTypeXFieldsSetOp _fields;

  StimModelTypeXRulesSetOp _rules;

  StimModelTypeXMixinsSetOp get mixins {
    return _mixins ??= StimModelTypeXMixinsSetOp(this, stimpack.model.type);
  }

  set mixins(StimModelTypeXMixinsSetOp value) {
    _mixins = value;
  }
  StimModelTypeXFieldsSetOp get fields {
    return _fields ??= StimModelTypeXFieldsSetOp(this, stimpack.model.field);
  }

  set fields(StimModelTypeXFieldsSetOp value) {
    _fields = value;
  }
  StimModelTypeXRulesSetOp get rules {
    return _rules ??= StimModelTypeXRulesSetOp(this, stimpack.model.rule);
  }

  set rules(StimModelTypeXRulesSetOp value) {
    _rules = value;
  }
  StimModelTypeSet(this._scope, List<StimModelType> items):
      super(_scope, items);
}


abstract class StimModelTypeScope extends StimScope<StimModelType, StimModelTypeSet> {
  StimModelType get double;
  StimModelType get float;
  StimModelType get int32;
  StimModelType get int64;
  StimModelType get uint32;
  StimModelType get uint64;
  StimModelType get sint32;
  StimModelType get sint64;
  StimModelType get fixed32;
  StimModelType get fixed64;
  StimModelType get sfixed32;
  StimModelType get sfixed64;
  StimModelType get bool;
  StimModelType get string;
  StimModelType get bytes;
  StimModelType get timestamp;
  StimModelType get date;
  StimModelType get time;
  StimModelType get datetime;
  StimModelType get localDate;
  StimModelType get localTime;
  StimModelType get localDatetime;
  StimModelType get user;
  StimModelType get userProfile;
  StimModelType get accessToken;
  StimModelType get apiPage;
  StimModelType get apiOffsetLimit;

  StimModelType of(name, {dynamic mixins, dynamic fields, dynamic rules});
}


class _StimModelTypeScopeImpl extends StimScopeImpl<StimModelType, StimModelTypeSet> implements StimModelTypeScope {
  StimModelType _double;

  StimModelType _float;

  StimModelType _int32;

  StimModelType _int64;

  StimModelType _uint32;

  StimModelType _uint64;

  StimModelType _sint32;

  StimModelType _sint64;

  StimModelType _fixed32;

  StimModelType _fixed64;

  StimModelType _sfixed32;

  StimModelType _sfixed64;

  StimModelType _bool;

  StimModelType _string;

  StimModelType _bytes;

  StimModelType _timestamp;

  StimModelType _date;

  StimModelType _time;

  StimModelType _datetime;

  StimModelType _localDate;

  StimModelType _localTime;

  StimModelType _localDatetime;

  StimModelType _user;

  StimModelType _userProfile;

  StimModelType _accessToken;

  StimModelType _apiPage;

  StimModelType _apiOffsetLimit;

  StimModelTypeSet mixins;

  StimModelFieldSet fields;

  StimModelRuleSet rules;

  @override
  StimModelType get double {
    return _double ??= of('double');
  }
  @override
  StimModelType get float {
    return _float ??= of('float');
  }
  @override
  StimModelType get int32 {
    return _int32 ??= of('int32');
  }
  @override
  StimModelType get int64 {
    return _int64 ??= of('int64');
  }
  @override
  StimModelType get uint32 {
    return _uint32 ??= of('uint32');
  }
  @override
  StimModelType get uint64 {
    return _uint64 ??= of('uint64');
  }
  @override
  StimModelType get sint32 {
    return _sint32 ??= of('sint32');
  }
  @override
  StimModelType get sint64 {
    return _sint64 ??= of('sint64');
  }
  @override
  StimModelType get fixed32 {
    return _fixed32 ??= of('fixed32');
  }
  @override
  StimModelType get fixed64 {
    return _fixed64 ??= of('fixed64');
  }
  @override
  StimModelType get sfixed32 {
    return _sfixed32 ??= of('sfixed32');
  }
  @override
  StimModelType get sfixed64 {
    return _sfixed64 ??= of('sfixed64');
  }
  @override
  StimModelType get bool {
    return _bool ??= of('bool');
  }
  @override
  StimModelType get string {
    return _string ??= of('string');
  }
  @override
  StimModelType get bytes {
    return _bytes ??= of('bytes');
  }
  @override
  StimModelType get timestamp {
    return _timestamp ??= of('timestamp');
  }
  @override
  StimModelType get date {
    return _date ??= of('date');
  }
  @override
  StimModelType get time {
    return _time ??= of('time');
  }
  @override
  StimModelType get datetime {
    return _datetime ??= of('datetime');
  }
  @override
  StimModelType get localDate {
    return _localDate ??= of('local date');
  }
  @override
  StimModelType get localTime {
    return _localTime ??= of('local time');
  }
  @override
  StimModelType get localDatetime {
    return _localDatetime ??= of('local datetime');
  }
  @override
  StimModelType get user {
    return _user ??= of('user');
  }
  @override
  StimModelType get userProfile {
    return _userProfile ??= of('user profile');
  }
  @override
  StimModelType get accessToken {
    return _accessToken ??= of('access token');
  }
  @override
  StimModelType get apiPage {
    return _apiPage ??= of('api page');
  }
  @override
  StimModelType get apiOffsetLimit {
    return _apiOffsetLimit ??= of('api offset limit');
  }
  _StimModelTypeScopeImpl():
      super();


  @override
  StimModelType of(name, {dynamic mixins, dynamic fields, dynamic rules}) {
    return createAndClear(name)
        ..mixins += mixins ?? stimpack.model.type.noneSet
        ..fields += fields ?? stimpack.model.field.noneSet
        ..rules += rules ?? stimpack.model.rule.noneSet;
  }

  @override
  void clear(StimModelType symbol) {
    symbol
        ..mixins = stimpack.model.type.noneSet
        ..fields = stimpack.model.field.noneSet
        ..rules = stimpack.model.rule.noneSet;
  }

  @override
  StimModelType create() {
    return StimModelType(this);
  }

  @override
  StimModelTypeSet createSet(List<StimModelType> items) {
    return StimModelTypeSet(this, items);
  }
}
