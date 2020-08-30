part of g3.stimpack.meta.techlab;

class StimMetaValidator {
  final Set<StimMetaPack> _validatedPacks = {};
  final Set<StimMetaType> _validatedTypes = {};
  final Set<StimMetaField> _validatedFields = {};
  final Set<StimMetaKind> _validatedKinds = {};
  final Set<StimMetaPreset> _validatedPresets = {};
  final Set<StimMetaValue> _validatedValues = {};

  // region validate

  void validatePack(StimMetaPack pack) {
    final name = _packName(pack);
    assert(
        pack != null,
        'pack should never be null. '
        'Make sure it is stimpack.meta.pack.none.');

    assert(!pack.isNone, '${name}pack is required');

    if (isPackValidated(pack)) return;

    assert(pack.name?.isNotEmpty == true, 'pack name is required');

    assert(
        pack.types != null,
        "${name}'s types should never be null. "
        'Make sure it is stimpack.meta.type.noneSet.');

    assert(
        pack.presets != null,
        "${name}'s presets should never be null. "
        'Make sure it is stimpack.meta.preset.noneSet.');

    _validatedPacks.add(pack);

    for (final type in pack.types) {
      validateType(type, pack: pack);
    }

    for (final preset in pack.presets) {
      validatePreset(preset, pack: pack);
    }
  }

  void validateType(StimMetaType type, {StimMetaPack pack}) {
    final name = '${_packName(type?.pack ?? pack)}'
        '${_typeName(type)}';

    assert(
      type != null,
      '${name}type should never be null. '
      'Makes sure it is initialized with stimpack.meta.type.none.',
    );

    assert(!type.isNone, '${name}type is required');

    if (isTypeValidated(type)) return;
    _validatedTypes.add(type);

    assert(type.name?.isNotEmpty == true, '${name}type name is required');

    assert(
      type.fields != null,
      '${name}fields should never be null. '
      'Makes sure it is initialized with stimpack.meta.field.noneSet.',
    );

    if (type.pack != null) validatePack(type.pack);

    // Make sure not cyclic dependency.
    for (final field in type.fields) {
      validateField(field, pack: pack, type: type);
    }
  }

  void validateField(StimMetaField field,
      {StimMetaPack pack, StimMetaType type}) {
    final name = '${_packName(type?.pack ?? pack)}'
        '${_typeName(type)}'
        '${_fieldName(field)}';

    assert(
        field != null,
        '${name}field cannot be null.'
        'Makes sure it is initialized with stimpack.meta.field.none.');

    assert(!field.isNone, '${name}field is required');

    if (isFieldValidated(field)) return;
    _validatedFields.add(field);

    assert(field.name?.isNotEmpty == true, '${name}field name is required');

    validateType(field.type, pack: pack);

    if (field.kind?.isNone != true) {
      // kind is optional.
      validateKind(field.kind, pack: pack, type: type, field: field);
    }
  }

  void validateKind(StimMetaKind kind,
      {StimMetaPack pack, StimMetaType type, StimMetaField field}) {
    final name = '${_packName(type?.pack ?? pack)}'
        '${_typeName(type)}'
        '${_fieldName(field)}'
        '${_kindName(kind)}';

    assert(
        kind != null,
        '${name}kind cannot be null.'
        'Makes sure it is initialized with stimpack.meta.kind.none.');

    assert(!kind.isNone, '${name}kind is required');

    if (isKindValidated(kind)) return;
    _validatedKinds.add(kind);

    assert(kind.name?.isNotEmpty == true, '${name}kind name is required');
  }

  void validatePreset(StimMetaPreset preset, {StimMetaPack pack}) {
    final name = '${_packName(pack)}'
        '${_typeName(preset?.type)}'
        '${_presetName(preset)}';

    assert(
      preset != null,
      '${name}preset cannot be null'
      'Makes sure it is initialized with stimpack.meta.preset.none.',
    );

    assert(!preset.isNone, '${name}preset is required');
    if (isPresetValidated(preset)) return;
    _validatedPresets.add(preset);

    assert(preset.name?.isNotEmpty == true, '${preset}name is required');

    assert(
      preset.values != null,
      '${name} value should never be null. '
      'Makes sure it is initialized with stimpack.meta.value.noneSet.',
    );

    for (final value in preset.values) {
      validateValue(value, pack: pack, preset: preset);
    }
  }

  void validateValue(
    StimMetaValue value, {
    StimMetaPack pack,
    StimMetaPreset preset,
  }) {
    final name = '${_packName(pack)}'
        '${_typeName(preset?.type)}'
        '${_presetName(preset)}'
        '${_valueName(value)}';

    assert(
      value != null,
      '${name}value cannot be null'
      'Makes sure it is initialized with stimpack.meta.value.none.',
    );

    assert(!value.isNone, '${name}value is required');

    if (isValueValidated(value)) return;
    _validatedValues.add(value);

    assert(value.name?.isNotEmpty == true, '${name}value name is required');
  }

  // endregion

  // region check if validated

  bool isPackValidated(StimMetaPack pack) {
    return pack.isNone || _validatedPacks.contains(pack);
  }

  bool isTypeValidated(StimMetaType type) {
    return type.isNone || _validatedTypes.contains(type);
  }

  bool isFieldValidated(StimMetaField field) {
    return field.isNone || _validatedFields.contains(field);
  }

  bool isKindValidated(StimMetaKind kind) {
    return kind.isNone || _validatedKinds.contains(kind);
  }

  bool isPresetValidated(StimMetaPreset preset) {
    return preset.isNone || _validatedPresets.contains(preset);
  }

  bool isValueValidated(StimMetaValue value) {
    return value.isNone || _validatedValues.contains(value);
  }

  // endregion

  // region extract names

  String _packName(StimMetaPack pack) {
    return _name(pack?.name, 'pack');
  }

  String _typeName(StimMetaType type) {
    return _name(type?.name, 'type');
  }

  String _fieldName(StimMetaField field) {
    return _name(field?.name, 'field');
  }

  String _kindName(StimMetaKind kind) {
    return _name(kind?.name, 'kind');
  }

  String _presetName(StimMetaPreset preset) {
    return _name(preset?.name, 'preset');
  }

  String _valueName(StimMetaValue value) {
    return _name(value?.name, 'value');
  }

  String _name(Name name, String prefix) {
    var s = name?.camel()?.toString()?.trim() ?? '';
    prefix = prefix?.trim() ?? '';
    if (prefix.isNotEmpty) prefix = '$prefix: ';

    return s.isEmpty ? '' : '${prefix}"$name", ';
  }

// endregion
}
