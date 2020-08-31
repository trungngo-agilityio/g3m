part of g3.stimpack.meta.generated;



class StimMetaType extends StimSymbol<StimMetaType, StimMetaTypeSet> {
  StimMetaFieldSet fields;

  StimMetaPack pack;

  StimMetaValueSet values;

  StimMetaType(_StimMetaTypeScopeImpl scope):
      super(scope);


  @override
  StimMetaType clone() {
    return super.clone()
        ..fields = fields.clone()
        ..pack = pack.clone()
        ..values = values.clone();
  }
}


class StimMetaTypeSet extends StimSymbolSet<StimMetaType, StimMetaTypeSet> {
  final _StimMetaTypeScopeImpl _scope;

  StimMetaTypeXFieldsSetOp _fields;

  StimMetaTypeXPackOp _pack;

  StimMetaTypeXValuesSetOp _values;

  StimMetaTypeXFieldsSetOp get fields {
    return _fields ??= StimMetaTypeXFieldsSetOp(this, stimpack.meta.field);
  }

  set fields(StimMetaTypeXFieldsSetOp value) {
    _fields = value;
  }
  StimMetaTypeXPackOp get pack {
    return _pack ??= StimMetaTypeXPackOp(this, stimpack.meta.pack);
  }

  set pack(StimMetaTypeXPackOp value) {
    _pack = value;
  }
  StimMetaTypeXValuesSetOp get values {
    return _values ??= StimMetaTypeXValuesSetOp(this, stimpack.meta.value);
  }

  set values(StimMetaTypeXValuesSetOp value) {
    _values = value;
  }
  StimMetaTypeSet(this._scope, List<StimMetaType> items):
      super(_scope, items);
}


abstract class StimMetaTypeScope extends StimScope<StimMetaType, StimMetaTypeSet> {
  StimMetaType get string;
  StimMetaType get num;
  StimMetaType get int;
  StimMetaType get double;
  StimMetaType get bool;
  StimMetaType get duration;
  StimMetaType get uri;
  StimMetaType get dateTime;
  StimMetaType get type;

  StimMetaType of(name, {dynamic fields, dynamic pack, dynamic values});
}


class _StimMetaTypeScopeImpl extends StimScopeImpl<StimMetaType, StimMetaTypeSet> implements StimMetaTypeScope {
  StimMetaType _string;

  StimMetaType _num;

  StimMetaType _int;

  StimMetaType _double;

  StimMetaType _bool;

  StimMetaType _duration;

  StimMetaType _uri;

  StimMetaType _dateTime;

  StimMetaType _type;

  StimMetaFieldSet fields;

  StimMetaPack pack;

  StimMetaValueSet values;

  @override
  StimMetaType get string {
    return _string ??= of('String');
  }
  @override
  StimMetaType get num {
    return _num ??= of('num');
  }
  @override
  StimMetaType get int {
    return _int ??= of('int');
  }
  @override
  StimMetaType get double {
    return _double ??= of('double');
  }
  @override
  StimMetaType get bool {
    return _bool ??= of('bool');
  }
  @override
  StimMetaType get duration {
    return _duration ??= of('Duration');
  }
  @override
  StimMetaType get uri {
    return _uri ??= of('Uri');
  }
  @override
  StimMetaType get dateTime {
    return _dateTime ??= of('DateTime');
  }
  @override
  StimMetaType get type {
    return _type ??= of('Type');
  }
  _StimMetaTypeScopeImpl():
      super();


  @override
  StimMetaType of(name, {dynamic fields, dynamic pack, dynamic values}) {
    return createAndClear(name)
        ..fields += fields ?? stimpack.meta.field.noneSet
        ..pack = pack ?? stimpack.meta.pack.none
        ..values += values ?? stimpack.meta.value.noneSet;
  }

  @override
  void clear(StimMetaType symbol) {
    symbol
        ..fields = stimpack.meta.field.noneSet
        ..pack = stimpack.meta.pack.none
        ..values = stimpack.meta.value.noneSet;
  }

  @override
  StimMetaType create() {
    return StimMetaType(this);
  }

  @override
  StimMetaTypeSet createSet(List<StimMetaType> items) {
    return StimMetaTypeSet(this, items);
  }
}
