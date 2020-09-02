part of g3.stimpack.model.generated;

class StimMetaXTypeXPreset {
  StimMetaTypeSet all;

  StimMetaType package;

  StimMetaType type;

  StimMetaType field;

  StimMetaType rule;

  StimMetaType pattern;

  StimMetaType range;

  void init(StimMetaTypeScope scope) {
    all = scope.noneSet;
    all += package = scope.of('package');
    all += type = scope.of('type');
    all += field = scope.of('field');
    all += rule = scope.of('rule');
    all += pattern = scope.of('pattern');
    all += range = scope.of('range');
  }
}

extension StimMetaXTypeXPresetExtension on StimMetaTypeScope {
  StimMetaXTypeXPreset get forModel {
    final impl = stimpack.model as StimModelImpl;
    return impl._metaXTypeXPreset;
  }
}
