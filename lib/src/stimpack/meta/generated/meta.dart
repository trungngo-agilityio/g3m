library g3.stimpack.meta.generated;

import 'package:g3m/stimpack_base.dart';

part 'meta_field.dart';

part 'meta_field__kind.dart';

part 'meta_field__type.dart';

part 'meta_kind.dart';

part 'meta_pack.dart';

part 'meta_pack__types.dart';

part 'meta_preset.dart';

part 'meta_preset__values.dart';

part 'meta_type.dart';

part 'meta_type__fields.dart';

part 'meta_type__pack.dart';

part 'meta_type__presets.dart';

part 'meta_value.dart';

StimMetaMeta _stimMetaMeta;

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
    final f = meta.field,
        t = meta.type,
        p = meta.preset,
        v = meta.value,
        k = meta.kind;
    final listKind = meta.kind.s.list;

    final kindType = t.of('kind');
    final typeType = t.of('type');
    final fieldType = t.of('field');
    final packType = t.of('pack');
    final presetType = t.of('preset');
    final valueType = t.of('value');

    typeType.fields += f.of('fields', kind: listKind, type: fieldType) +
        f.of('presets', kind: listKind, type: presetType) +
        f.of('pack', type: packType);

    fieldType.fields +=
        f.of('kind', type: kindType) + f.of('type', type: typeType);

    packType.fields += f.of('types', kind: listKind, type: typeType);

    presetType.fields += f.of('values', kind: listKind, type: valueType);

    kindType.presets += p.of(
      '',
      values: v.of('list'),
    );

    _meta = meta.pack.of('meta',
        types: kindType +
            typeType +
            fieldType +
            packType +
            presetType +
            valueType);
  }
}
