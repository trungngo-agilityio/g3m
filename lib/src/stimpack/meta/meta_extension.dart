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

StimMetaTypeSet _primitiveTypes;

extension StimMetaTypeScopeExtension on StimMetaTypeScope {

  /// Determines if the current type is a primitive type or not.
  bool get isPrimitive {
    final t = stimpack.meta.type;
    _primitiveTypes ??= t.string +
        t.num +
        t.int +
        t.double +
        t.bool +
        t.duration +
        t.uri +
        t.dateTime +
        t.type;

    return _primitiveTypes.contains(this);
  }
}

extension StimMetaFieldScopeExtension on StimMetaFieldScope {
  /// Creates a field which is a list of a [type].
  StimMetaField listOf(dynamic name, {dynamic type}) {
    final f = stimpack.meta.field;
    final k = stimpack.meta.kind;
    return f.of(name, type: type, kind: k.set);
  }
}

extension StimMetaFieldExtension on StimMetaField {
  // Determines if the current meta field is a set field.
  bool get isSet {
    // Important to note here that during code generation, this value
    // kind name is used a lot. In most case, it is ok to refer to an
    // existing in-memory value [stimpack.meta.kind.set]; however, only
    // the case that the meta pack re-generate itself, the object instance
    // might be different where the generator recreate the kind.set object.
    return kind?.name?.toString() == 'set';
  }
}

extension StimMetaValueScopeExtension on StimMetaValueScope {
  StimMetaValueSet ofNames(Iterable<String> names) {
    if (names?.isNotEmpty != true) return noneSet;
    return createSet(names.map((e) => of(e)).toList());
  }
}
