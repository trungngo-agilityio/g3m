part of g3.stimpack.meta;

_StimMetaPackImpl _stimMetaPack;

extension StimBasePackExtension on Stimpack {
  _StimMetaPack get meta {
    return _stimMetaPack ??= _StimMetaPackImpl();
  }
}

abstract class _StimMetaPack {
  StimMetaPack get meta;

  _StimMetaKindScope get kind;

  _StimMetaFieldScope get field;

  _StimMetaTypeScope get type;

  _StimMetaPackScope get pack;
}

class _StimMetaPackImpl implements _StimMetaPack {
  StimMetaPack _meta;

  _StimMetaScopeImpl _kind;
  _StimMetaTypeScopeImpl _type;
  _StimMetaFieldScopeImpl _field;
  _StimPackScopeImpl _pack;

  @override
  StimMetaPack get meta => _meta;

  @override
  _StimMetaKindScope get kind => _kind;

  @override
  _StimMetaFieldScope get field => _field;

  @override
  _StimMetaTypeScope get type => _type;

  @override
  _StimMetaPackScope get pack => _pack;

  _StimMetaPackImpl() {
    // Notes that need to do 2 phase init to avoid cyclic dependency.
    _kind = _StimMetaScopeImpl._(this);
    _type = _StimMetaTypeScopeImpl._(this);
    _field = _StimMetaFieldScopeImpl._(this);
    _pack = _StimPackScopeImpl._(this);

    _kind.init();
    _type.init();
    _field.init();
    _pack.init();

    _buildMeta();
  }

  void _buildMeta() {
    final kindMeta = _type.of('kind');
    final fieldMeta = _type.of('field');
    final typeMeta = _type.of('type');
    final packMeta = _type.of('pack');

    _kind.list = _kind.of('list');

    fieldMeta.fields +=
        _field.of('kind', type: kindMeta) + _field.of('type', type: typeMeta);
    typeMeta.fields += _field.of('fields', kind: _kind.list, type: fieldMeta);
    packMeta.fields += _field.of('types', kind: _kind.list, type: typeMeta);

    _meta =
        _pack.of('model', types: kindMeta + typeMeta + fieldMeta + packMeta);
  }
}
