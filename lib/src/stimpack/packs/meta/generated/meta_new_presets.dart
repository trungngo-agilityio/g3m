part of g3.stimpack.meta_new.generated;



class StimMetaNewTypeMetaNewPreset {
  StimMetaNewTypeSet all;

  StimMetaNewType kind;

  StimMetaNewType type;

  StimMetaNewType field;

  StimMetaNewType pack;

  StimMetaNewType preset;

  StimMetaNewType value;


  StimMetaNewTypeMetaNewPreset(StimMetaNewTypeScope scope) {
    all = scope.noneSet;
    all += kind = scope.of('kind');
    all += type = scope.of('type');
    all += field = scope.of('field');
    all += pack = scope.of('pack');
    all += preset = scope.of('preset');
    all += value = scope.of('value');
  }
}
StimMetaNewTypeMetaNewPreset  _extStimMetaNewTypeMetaNewPreset;

extension StimMetaNewTypeMetaNewPresetExtension on StimMetaNewTypeScope {
  StimMetaNewTypeMetaNewPreset get forMetaNew {
    return _extStimMetaNewTypeMetaNewPreset ??= StimMetaNewTypeMetaNewPreset(stimpack.metaNew.type);
  }
}
    