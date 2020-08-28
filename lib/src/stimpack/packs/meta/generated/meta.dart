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

abstract class StimMetaMeta {
  StimMetaPack get meta;

  StimMetaKindScope get kind;
  StimMetaTypeScope get type;
  StimMetaFieldScope get field;
  StimMetaPackScope get pack;
  StimMetaPresetScope get preset;
  StimMetaValueScope get value;

}

class _StimMetaMetaImpl implements StimMetaMeta {
  StimMetaPack _meta;

  
  _StimMetaKindScopeImpl _kind;
  
  _StimMetaTypeScopeImpl _type;
  
  _StimMetaFieldScopeImpl _field;
  
  _StimMetaPackScopeImpl _pack;
  
  _StimMetaPresetScopeImpl _preset;
  
  _StimMetaValueScopeImpl _value;


  @override
  StimMetaPack get meta => _meta;

  
  @override
  StimMetaKindScope get kind => _kind;
  
  @override
  StimMetaTypeScope get type => _type;
  
  @override
  StimMetaFieldScope get field => _field;
  
  @override
  StimMetaPackScope get pack => _pack;
  
  @override
  StimMetaPresetScope get preset => _preset;
  
  @override
  StimMetaValueScope get value => _value;

  _StimMetaMetaImpl() {
    _kind = _StimMetaKindScopeImpl._(this);
    _type = _StimMetaTypeScopeImpl._(this);
    _field = _StimMetaFieldScopeImpl._(this);
    _pack = _StimMetaPackScopeImpl._(this);
    _preset = _StimMetaPresetScopeImpl._(this);
    _value = _StimMetaValueScopeImpl._(this);

  }
  
  void init() {
    _kind.init();
    _type.init();
    _field.init();
    _pack.init();
    _preset.init();
    _value.init();

    _buildMeta();
  }

  void _buildMeta() {
    final meta = this;
    final listKind = meta.kind.s.list;

    final kindType = meta.type.of('kind');
    final typeType = meta.type.of('type');
    final fieldType = meta.type.of('field');
    final packType = meta.type.of('pack');
    final presetType = meta.type.of('preset');
    final valueType = meta.type.of('value');

    typeType.fields += 
        meta.field.of('fields', kind: listKind, type: fieldType) + 
        meta.field.of('presets', kind: listKind, type: presetType) + 
        meta.field.of('pack', type: packType);

    fieldType.fields += 
        meta.field.of('kind', type: kindType) + 
        meta.field.of('type', type: typeType);

    packType.fields += 
        meta.field.of('types', kind: listKind, type: typeType);

    presetType.fields += 
        meta.field.of('values', kind: listKind, type: valueType);

    _meta = meta.pack.of('meta', types: kindType + typeType + fieldType + packType + presetType + valueType);
  }
}
    