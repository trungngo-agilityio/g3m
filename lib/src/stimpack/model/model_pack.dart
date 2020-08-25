part of g3.stimpack.model;

_StimModelPackImpl _stimBasePackImpl;

extension StimBasePackExtension on Stimpack {
  _StimModelPack get model {
    return _stimBasePackImpl ??= _StimModelPackImpl();
  }
}

abstract class _StimModelPack {
  StimPack get meta;

  _StimValueScope get value;

  _StimFieldScope get field;

  _StimTypeScope get type;

  _StimPackScope get pack;
}

class _StimModelPackImpl implements _StimModelPack {
  StimPack _meta;

  _StimValueScopeImpl _value;
  _StimTypeScopeImpl _type;
  _StimFieldScopeImpl _field;
  _StimPackScopeImpl _pack;

  @override
  StimPack get meta => _meta;

  @override
  _StimValueScope get value => _value;

  @override
  _StimFieldScope get field => _field;

  @override
  _StimTypeScope get type => _type;

  @override
  _StimPackScope get pack => _pack;

  _StimModelPackImpl() {
    // Notes that need to do 2 phase init to avoid cyclic dependency.
    _value = _StimValueScopeImpl._(this);
    _type = _StimTypeScopeImpl._(this);
    _field = _StimFieldScopeImpl._(this);
    _pack = _StimPackScopeImpl._(this);

    _value.init();
    _type.init();
    _field.init();
    _pack.init();

    _buildMeta();
  }

  void _buildMeta() {
    final valueMeta = _type.of('value');
    final fieldMeta = _type.of('field');
    final typeMeta = _type.of('type');
    final packMeta = _type.of('pack');

    final listKind = _value.of('list');

    fieldMeta.fields +=
        _field.of('kind', type: valueMeta) + _field.of('type', type: typeMeta);
    typeMeta.fields += _field.of('fields', kind: listKind, type: fieldMeta);
    packMeta.fields += _field.of('types', kind: listKind, type: typeMeta);

    _meta =
        _pack.of('model', types: valueMeta + typeMeta + fieldMeta + packMeta);
  }
}
