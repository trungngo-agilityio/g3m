part of g3.stimpack.meta;

extension StimMetaPresetScopeExtension on StimMetaPresetScope {
  StimMetaPreset ofValues(dynamic name, List<dynamic> values) {
    final v = stimpack.meta.value;
    var pv = stimpack.meta.value.noneSet;
    for (final i in values) {
      pv += v.of(i);
    }
    return stimpack.meta.preset.of(name, values: pv);
  }
}
