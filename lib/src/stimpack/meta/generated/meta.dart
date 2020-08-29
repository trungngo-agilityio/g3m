library g3.stimpack.meta.generated;


import 'package:g3m/stimpack_base.dart';
part 'meta_kind.dart';
part 'meta_type.dart';
part 'meta_type__fields.dart';
part 'meta_type__presets.dart';
part 'meta_type__pack.dart';
part 'meta_field.dart';
part 'meta_field__kind.dart';
part 'meta_field__type.dart';
part 'meta_pack.dart';
part 'meta_pack__types.dart';
part 'meta_preset.dart';
part 'meta_preset__values.dart';
part 'meta_value.dart';



abstract class StimMetaMeta {
  StimMetaPack get meta;
  StimMetaKindScope get kind;
  StimMetaTypeScope get type;
  StimMetaFieldScope get field;
  StimMetaPackScope get pack;
  StimMetaPresetScope get preset;
  StimMetaValueScope get value;
}


class _StimMetaMetaImpl  implements StimMetaMeta {
  StimMetaPack _meta;

  _StimMetaKindScopeImpl _kind;

  _StimMetaTypeScopeImpl _type;

  _StimMetaFieldScopeImpl _field;

  _StimMetaPackScopeImpl _pack;

  _StimMetaPresetScopeImpl _preset;

  _StimMetaValueScopeImpl _value;

  @override
  StimMetaPack get meta {
    return _meta;
  }
  @override
  _StimMetaKindScopeImpl get kind {
    return _kind;
  }
  @override
  _StimMetaTypeScopeImpl get type {
    return _type;
  }
  @override
  _StimMetaFieldScopeImpl get field {
    return _field;
  }
  @override
  _StimMetaPackScopeImpl get pack {
    return _pack;
  }
  @override
  _StimMetaPresetScopeImpl get preset {
    return _preset;
  }
  @override
  _StimMetaValueScopeImpl get value {
    return _value;
  }

  _StimMetaMetaImpl() {
    _kind = _StimMetaKindScopeImpl();
    _type = _StimMetaTypeScopeImpl();
    _field = _StimMetaFieldScopeImpl();
    _pack = _StimMetaPackScopeImpl();
    _preset = _StimMetaPresetScopeImpl();
    _value = _StimMetaValueScopeImpl();
  }


  void init() {
    _kind.init();
    _type.init();
    _field.init();
    _pack.init();
    _preset.init();
    _value.init();
    _buildMeta();
    _buildValues();
  }

  void _buildMeta() {
    final meta = this;
    final f = meta.field, t = meta.type, p = meta.preset, v = meta.value;
    final listKind = meta.kind.forMeta.list;

    final  kindType = t.of('kind');
    final  typeType = t.of('type');
    final  fieldType = t.of('field');
    final  packType = t.of('pack');
    final  presetType = t.of('preset');
    final  valueType = t.of('value');

    typeType.fields += 
        f.of('fields', kind: listKind, type: fieldType) + 
        f.of('presets', kind: listKind, type: presetType) + 
        f.of('pack', type: packType);

    fieldType.fields += 
        f.of('kind', type: kindType) + 
        f.of('type', type: typeType);

    packType.fields += 
        f.of('types', kind: listKind, type: typeType);

    presetType.fields += 
        f.of('values', kind: listKind, type: valueType);

    kindType.presets += 
        p.of('meta', values: 
              v.of('list'),);

    final packTypes = kindType + typeType + fieldType + packType + presetType + valueType;
    _meta = meta.pack.of('meta', types: packTypes);
    packTypes.pack.set(_meta);
  }
  // region custom code of meta stimpack

  /// This function shall be call during the init process.
  void _buildValues() {
    /// build all preset values here
  }

// endregion custom code of meta stimpack
}
StimMetaMeta  _stimMetaMeta;

extension StimMetaMetaExtension on Stimpack {
  StimMetaMeta get meta {
    if (_stimMetaMeta == null) {
      final impl = _stimMetaMeta = _StimMetaMetaImpl();
      impl.init();
      return _stimMetaMeta;
    }
    
    return _stimMetaMeta;
  }
}
    