part of g3.stimpack.meta;

extension StimMetaPresetScopeExtension on StimMetaPresetScope {
  /// Creates a presets from a given list of [values].
  StimMetaPreset ofValues(
    String name, {
    @required StimMetaType type,
    @required List<dynamic> values,
  }) {
    // assert(name?.isNotEmpty == true, 'name is required');
    assert(type != null, 'type is required');
    assert(values?.isNotEmpty == true, 'values is required');

    final v = stimpack.meta.value;
    var pv = stimpack.meta.value.noneSet;
    for (final i in values) {
      pv += v.of(i);
    }
    return stimpack.meta.preset.of(name, type: type, values: pv);
  }
}

extension StimMetaTypeScopeExtension on StimMetaTypeScope {}

extension StimMetaFieldScopeExtension on StimMetaFieldScope {
  /// Creates a field which is a list of a [type].
  StimMetaField listOf(dynamic name, {dynamic type}) {
    final f = stimpack.meta.field;
    final k = stimpack.meta.kind;
    return f.of(name, type: type, kind: k.forMeta.set);
  }
}

extension StimMetaFieldExtension on StimMetaField {
  // Determines if the current meta field is a set field.
  bool get isSet {
    return kind?.name?.toString() == 'set';
  }
}

extension StimMetaKindExtension on StimMetaKind {}
