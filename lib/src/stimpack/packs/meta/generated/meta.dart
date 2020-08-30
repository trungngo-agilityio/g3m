library g3.stimpack.meta.generated;


import 'package:g3m/stimpack_base.dart';
part 'meta_presets.dart';
part 'meta__kind.dart';
part 'meta__type.dart';
part 'meta__type__fields.dart';
part 'meta__type__pack.dart';
part 'meta__field.dart';
part 'meta__field__kind.dart';
part 'meta__field__type.dart';
part 'meta__pack.dart';
part 'meta__pack__types.dart';
part 'meta__pack__presets.dart';
part 'meta__preset.dart';
part 'meta__preset__values.dart';
part 'meta__preset__type.dart';
part 'meta__value.dart';



abstract class StimMeta {
  StimMetaPack get meta;
  StimMetaKindScope get kind;
  StimMetaTypeScope get type;
  StimMetaFieldScope get field;
  StimMetaPackScope get pack;
  StimMetaPresetScope get preset;
  StimMetaValueScope get value;
}


class StimMetaImpl  implements StimMeta {
  StimMetaPack _meta;

  _StimMetaKindScopeImpl _kind;

  _StimMetaTypeScopeImpl _type;

  _StimMetaFieldScopeImpl _field;

  _StimMetaPackScopeImpl _pack;

  _StimMetaPresetScopeImpl _preset;

  _StimMetaValueScopeImpl _value;

  StimMetaXTypeXPreset _metaXTypeXPreset;

  StimMetaXKindXMetaPreset _kindXMetaPreset;

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

  StimMetaImpl() {
    _kind = _StimMetaKindScopeImpl();
    _type = _StimMetaTypeScopeImpl();
    _field = _StimMetaFieldScopeImpl();
    _pack = _StimMetaPackScopeImpl();
    _preset = _StimMetaPresetScopeImpl();
    _value = _StimMetaValueScopeImpl();
    _metaXTypeXPreset = StimMetaXTypeXPreset();
    _kindXMetaPreset = StimMetaXKindXMetaPreset();
  }


  void init() {
    _kind.init();
    _type.init();
    _field.init();
    _pack.init();
    _preset.init();
    _value.init();
    _metaXTypeXPreset.init(stimpack.meta.type);
    _kindXMetaPreset.init(_kind);
    _buildMeta();
    _buildValues();
  }

  void _buildMeta() {
    final meta = this;
    final pack = meta.pack.of('meta');
    final f = meta.field, t = meta.type, p = meta.preset, v = meta.value;
    final setKind = meta.kind.forMeta.set;

    t.forMeta.type.fields = f.noneSet +
        f.of('fields', kind: setKind, type: t.forMeta.field) + 
        f.of('pack', type: t.forMeta.pack);

    t.forMeta.field.fields = f.noneSet +
        f.of('kind', type: t.forMeta.kind) + 
        f.of('type', type: t.forMeta.type);

    t.forMeta.pack.fields = f.noneSet +
        f.of('types', kind: setKind, type: t.forMeta.type) + 
        f.of('presets', kind: setKind, type: t.forMeta.preset);

    t.forMeta.preset.fields = f.noneSet +
        f.of('values', kind: setKind, type: t.forMeta.value) + 
        f.of('type', type: t.forMeta.type);

    pack.presets = p.noneSet +
        p.of('', type: t.forMeta.type, values: 
              v.of('kind') + 
              v.of('type') + 
              v.of('field') + 
              v.of('pack') + 
              v.of('preset') + 
              v.of('value'),)
         + 
        p.of('meta', type: t.forMeta.kind, values: 
              v.of('set'),);

    pack.types = t.forMeta.all;
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
StimMeta  _stimMeta;

extension StimMetaStimpackExtension on Stimpack {
  StimMeta get meta {
    if (_stimMeta == null) {
      final impl = _stimMeta = StimMetaImpl();
      impl.init();
      return _stimMeta;
    }
    
    return _stimMeta;
  }
}
    