library g3.stimpack.meta.generated;


import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';
part 'meta_presets.dart';
part 'meta_kind.dart';
part 'meta_type.dart';
part 'meta_type__fields.dart';
part 'meta_type__presets.dart';
part 'meta_type__pack.dart';
part 'meta_type__fields.dart';
part 'meta_type__presets.dart';
part 'meta_type__pack.dart';
part 'meta_field.dart';
part 'meta_field__kind.dart';
part 'meta_field__type.dart';
part 'meta_field__kind.dart';
part 'meta_field__type.dart';
part 'meta_pack.dart';
part 'meta_pack__types.dart';
part 'meta_pack__presets.dart';
part 'meta_pack__types.dart';
part 'meta_pack__presets.dart';
part 'meta_preset.dart';
part 'meta_preset__values.dart';
part 'meta_preset__type.dart';
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
    final pack = stimpack.meta.pack.of('meta');
    final f = meta.field, t = meta.type.forMeta, p = meta.preset, v = meta.value;
    final listKind = meta.kind.forMeta.list;

    final  kindType = t.kind;
    final  typeType = t.type;
    final  fieldType = t.field;
    final  packType = t.pack;
    final  presetType = t.preset;
    final  valueType = t.value;

    final  presetType = stimpack.meta.meta.types.firstWhereNameIs('preset');
    assert(presetType != null);
    typeType.fields += 
        f.of('fields', kind: listKind, type: fieldType) + 
        f.of('presets', kind: listKind, type: presetType) + 
        f.of('pack', type: packType) + 
        f.of('fields', kind: listKind, type: fieldType) + 
        f.of('presets', kind: listKind, type: presetType) + 
        f.of('pack', type: packType);

    fieldType.fields += 
        f.of('kind', type: kindType) + 
        f.of('type', type: typeType) + 
        f.of('kind', type: kindType) + 
        f.of('type', type: typeType);

    packType.fields += 
        f.of('types', kind: listKind, type: typeType) + 
        f.of('presets', kind: listKind, type: presetType) + 
        f.of('types', kind: listKind, type: typeType) + 
        f.of('presets', kind: listKind, type: presetType);

    presetType.fields += 
        f.of('values', kind: listKind, type: valueType) + 
        f.of('type', type: typeType);

    pack.presets += 
        p.of('meta', type: stimpack.meta.type.forMeta.type, values: 
              v.of('kind') + 
              v.of('type') + 
              v.of('field') + 
              v.of('pack') + 
              v.of('preset') + 
              v.of('value'),);

    pack.types += kindType + typeType + fieldType + packType + presetType + valueType;
    pack.types.pack.set(pack);
    _meta = pack;
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
    