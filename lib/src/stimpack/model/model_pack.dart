part of g3.stimpack.model;

_StimModelPackImpl _stimBasePackImpl;

extension StimBasePackExtension on Stimpack {
  _StimModelPack get model {
    return _stimBasePackImpl ??= _StimModelPackImpl();
  }
}

abstract class _StimModelPack {
  _StimType get meta;

  _StimFieldScope get field;

  _StimTypeScope get type;
}

class _StimModelPackImpl implements _StimModelPack {
  _StimType _meta;
  _StimTypeScopeImpl _type;
  _StimFieldScopeImpl _field;

  @override
  _StimType get meta => _meta;

  @override
  _StimFieldScope get field => _field;

  @override
  _StimTypeScope get type => _type;

  _StimModelPackImpl() {
    // Notes that need to do 2 phase init to avoid cyclic dependency.
    _type = _StimTypeScopeImpl._(this);
    _field = _StimFieldScopeImpl._(this);

    _type.init();
    _field.init();

    _buildMeta();
  }

  void _buildMeta() {
    _meta = _type.of('meta');

    final fieldMeta = _type.of('field');
    final fieldSetMeta = _type.of('fields');
    final typeMeta = _type.of('type');
    final typeSetMeta = _type.of('types');

    final typeField = _field.of('type', type: typeMeta);
    final typeSetField = _field.of('types', type: typeSetMeta);
    final fieldSetField = _field.of('fields', type: fieldSetMeta);

    // a field must have a type
    fieldMeta.fields += typeField;

    // a type must have many fields
    typeMeta.fields += fieldSetField;

    // a meta type must have two field
    _meta.fields += typeSetField;
  }
}
