part of g3.stimpack.meta.generated;



class StimMetaXTypeXPreset {
  StimMetaTypeSet all;

  StimMetaType kind;

  StimMetaType type;

  StimMetaType field;

  StimMetaType pack;

  StimMetaType preset;

  StimMetaType value;


  void init(StimMetaTypeScope scope) {
    all = scope.noneSet;
    all += kind = scope.of('kind');
    all += type = scope.of('type');
    all += field = scope.of('field');
    all += pack = scope.of('pack');
    all += preset = scope.of('preset');
    all += value = scope.of('value');
  }
}


class StimMetaXKindXMetaPreset {
  StimMetaKindSet all;

  StimMetaKind set;


  void init(StimMetaKindScope scope) {
    all = scope.noneSet;
    all += set = scope.of('set');
  }
}
extension StimMetaXTypeXPresetExtension on StimMetaTypeScope {
  StimMetaXTypeXPreset get forMeta {
    final impl = stimpack.meta as StimMetaImpl;
    return impl._metaXTypeXPreset; 
  }
}
    
extension StimMetaXKindXMetaPresetExtension on StimMetaKindScope {
  StimMetaXKindXMetaPreset get forMeta {
    final impl = stimpack.meta as StimMetaImpl;
    return impl._kindXMetaPreset; 
  }
}
    