part of g3.stimpack.meta;

class StimMetaValidator {
  final Set<StimModelPackage> _validatedPacks = {};
  final Set<StimModelType> _validatedTypes = {};
  final Set<StimModelField> _validatedFields = {};
  final Set<StimModelTag> _validatedValues = {};

  // region validate

  void validatePack(StimModelPackage pack) {
    final name = _packName(pack);
    assert(pack != null, 'pack is required');

    if (isPackValidated(pack)) return;

    assert(pack.name?.isNotEmpty == true, 'pack name is required');

    _validatedPacks.add(pack);

    if (pack.types != null) {
      for (final type in pack.types) {
        validateType(type, pack: pack);
      }
    }
  }

  void validateType(StimModelType type, {StimModelPackage pack}) {
    final typePack = type.package ?? pack;
    final name = '${_packName(typePack)}'
        '${_typeName(type)}';

    assert(type != null, '${name}type is required.');

    if (isTypeValidated(type)) return;
    _validatedTypes.add(type);

    assert(type.name?.isNotEmpty == true, '${name}type name is required');

    if (type?.package != null) validatePack(type.package);

    // Make sure not cyclic dependency.
    if (type.fields != null) {
      for (final field in type.fields) {
        validateField(field, pack: pack, type: type);
      }
    }
  }

  void validateField(StimModelField field,
      {StimModelPackage pack, StimModelType type}) {
    final typePack = type?.package ?? pack;
    final name = '${_packName(typePack)}'
        '${_typeName(type)}'
        '${_fieldName(field)}';

    assert(field != null, '${name}field is required');

    if (isFieldValidated(field)) return;
    _validatedFields.add(field);

    assert(field.name?.isNotEmpty == true, '${name}field name is required');

    validateType(field.type, pack: pack);
  }

  // endregion

  // region check if validated

  bool isPackValidated(StimModelPackage pack) {
    return pack == null || _validatedPacks.contains(pack);
  }

  bool isTypeValidated(StimModelType type) {
    return type == null || _validatedTypes.contains(type);
  }

  bool isFieldValidated(StimModelField field) {
    return field == null || _validatedFields.contains(field);
  }

  bool isValueValidated(StimModelTag value) {
    return value == null || _validatedValues.contains(value);
  }

  // endregion

  // region extract names

  String _packName(StimModelPackage pack) {
    return _name(pack?.name, 'pack');
  }

  String _typeName(StimModelType type) {
    return _name(type?.name, 'type');
  }

  String _fieldName(StimModelField field) {
    return _name(field?.name, 'field');
  }

  String _name(StimName name, String prefix) {
    var s = name?.camel()?.toString()?.trim() ?? '';
    prefix = prefix?.trim() ?? '';
    if (prefix.isNotEmpty) prefix = '$prefix: ';

    return s.isEmpty ? '' : '${prefix}"$name", ';
  }

// endregion
}
