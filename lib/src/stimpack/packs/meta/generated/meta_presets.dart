part of g3.stimpack.meta.generated;



class StimMetaTypeMetaPreset {
  StimMetaTypeSet all;

  StimMetaType kind;

  StimMetaType type;

  StimMetaType field;

  StimMetaType pack;

  StimMetaType preset;

  StimMetaType value;


  StimMetaTypeMetaPreset(StimMetaTypeScope scope) {
    all = scope.noneSet;
    all += kind = scope.of('kind');
    all += type = scope.of('type');
    all += field = scope.of('field');
    all += pack = scope.of('pack');
    all += preset = scope.of('preset');
    all += value = scope.of('value');
  }
}
StimMetaTypeMetaPreset  _extStimMetaTypeMetaPreset;

extension StimMetaTypeMetaPresetExtension on StimMetaTypeScope {
  StimMetaTypeMetaPreset get forMeta {
    return _extStimMetaTypeMetaPreset ??= StimMetaTypeMetaPreset(stimpack.meta.type);
  }
}
    