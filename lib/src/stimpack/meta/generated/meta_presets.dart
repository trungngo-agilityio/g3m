part of g3.stimpack.meta.generated;



class _StimMetaXTypeXMetaPreset {
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


class _StimMetaXKindXMetaPreset {
  StimMetaKindSet all;

  StimMetaKind set;


  void init(StimMetaKindScope scope) {
    all = scope.noneSet;
    all += set = scope.of('set');
  }
}
extension StimMetaXTypeXMetaPresetExtension on StimMetaTypeScope {
  _StimMetaXTypeXMetaPreset get forMeta {
    final impl = stimpack.meta as StimMetaImpl;
    return impl._metaXTypeXMetaPreset; 
  }
}
    
extension StimMetaXKindXMetaPresetExtension on StimMetaKindScope {
  _StimMetaXKindXMetaPreset get forMeta {
    final impl = stimpack.meta as StimMetaImpl;
    return impl._kindXMetaPreset; 
  }
}
    