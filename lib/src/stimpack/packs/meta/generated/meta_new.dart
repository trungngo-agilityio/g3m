library g3.stimpack.meta_new.generated;


import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';
part 'meta_new_presets.dart';
part 'meta_new_kind.dart';
part 'meta_new_type.dart';
part 'meta_new_type__fields.dart';
part 'meta_new_type__presets.dart';
part 'meta_new_type__pack.dart';
part 'meta_new_type__fields.dart';
part 'meta_new_type__presets.dart';
part 'meta_new_type__pack.dart';
part 'meta_new_field.dart';
part 'meta_new_field__kind.dart';
part 'meta_new_field__type.dart';
part 'meta_new_field__kind.dart';
part 'meta_new_field__type.dart';
part 'meta_new_pack.dart';
part 'meta_new_pack__types.dart';
part 'meta_new_pack__presets.dart';
part 'meta_new_pack__types.dart';
part 'meta_new_pack__presets.dart';
part 'meta_new_preset.dart';
part 'meta_new_preset__values.dart';
part 'meta_new_preset__type.dart';
part 'meta_new_value.dart';



abstract class StimMetaNewMetaNew {
  StimMetaPack get meta;
  StimMetaNewKindScope get kind;
  StimMetaNewTypeScope get type;
  StimMetaNewFieldScope get field;
  StimMetaNewPackScope get pack;
  StimMetaNewPresetScope get preset;
  StimMetaNewValueScope get value;
}


class _StimMetaNewMetaNewImpl  implements StimMetaNewMetaNew {
  StimMetaPack _meta;

  _StimMetaNewKindScopeImpl _kind;

  _StimMetaNewTypeScopeImpl _type;

  _StimMetaNewFieldScopeImpl _field;

  _StimMetaNewPackScopeImpl _pack;

  _StimMetaNewPresetScopeImpl _preset;

  _StimMetaNewValueScopeImpl _value;

  @override
  StimMetaPack get meta {
    return _meta;
  }
  @override
  _StimMetaNewKindScopeImpl get kind {
    return _kind;
  }
  @override
  _StimMetaNewTypeScopeImpl get type {
    return _type;
  }
  @override
  _StimMetaNewFieldScopeImpl get field {
    return _field;
  }
  @override
  _StimMetaNewPackScopeImpl get pack {
    return _pack;
  }
  @override
  _StimMetaNewPresetScopeImpl get preset {
    return _preset;
  }
  @override
  _StimMetaNewValueScopeImpl get value {
    return _value;
  }

  _StimMetaNewMetaNewImpl() {
    _kind = _StimMetaNewKindScopeImpl();
    _type = _StimMetaNewTypeScopeImpl();
    _field = _StimMetaNewFieldScopeImpl();
    _pack = _StimMetaNewPackScopeImpl();
    _preset = _StimMetaNewPresetScopeImpl();
    _value = _StimMetaNewValueScopeImpl();
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
    final meta = stimpack.meta;
    final pack = stimpack.meta.pack.of('metaNew');
    final f = meta.field, t = meta.type.forMetaNew, p = meta.preset, v = meta.value;
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
        p.of('metaNew', type: stimpack.meta.type.forMetaNew.type, values: 
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
  // region custom code of meta new stimpack

  /// This function shall be call during the init process.
  void _buildValues() {
    /// build all preset values here
  }

  // endregion custom code of meta new stimpack
}
StimMetaNewMetaNew  _stimMetaNewMetaNew;

extension StimMetaNewMetaNewExtension on Stimpack {
  StimMetaNewMetaNew get metaNew {
    if (_stimMetaNewMetaNew == null) {
      final impl = _stimMetaNewMetaNew = _StimMetaNewMetaNewImpl();
      impl.init();
      return _stimMetaNewMetaNew;
    }
    
    return _stimMetaNewMetaNew;
  }
}
    