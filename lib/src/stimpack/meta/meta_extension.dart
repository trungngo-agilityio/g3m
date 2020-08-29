part of g3.stimpack.meta;

extension StimMetaPresetScopeExtension on StimMetaPresetScope {
  /// Creates a presets from a given list of [values].
  StimMetaPreset ofValues(dynamic name, List<dynamic> values) {
    final v = stimpack.meta.value;
    var pv = stimpack.meta.value.noneSet;
    for (final i in values) {
      pv += v.of(i);
    }
    return stimpack.meta.preset.of(name, values: pv);
  }
}

extension StimMetaTypeScopeExtension on StimMetaTypeScope {}

extension StimMetaFieldScopeExtension on StimMetaFieldScope {
  /// Creates a field which is a list of a [type].
  StimMetaField listOf(dynamic name, {dynamic type}) {
    final f = stimpack.meta.field;
    final k = stimpack.meta.kind;
    return f.of(name, type: type, kind: k.s.list);
  }
}

extension StimMetaFieldExtension on StimMetaField {
  // Determines if the current meta field is a set field.
  bool get isSet {
    return kind == stimpack.meta.kind.s.list;
  }
}

extension StimMetaKindExtension on StimMetaKind {}
