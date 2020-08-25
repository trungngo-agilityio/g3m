part of g3.stimpack.model;

_StimBasePackImpl _stimBasePackImpl;

extension StimBasePackExtension on Stimpack {
  _StimBasePack get model {
    return _stimBasePackImpl ??= _StimBasePackImpl();
  }
}

abstract class _StimBasePack {
  _StimFieldScope get field;

  _StimTypeScope get type;
}

class _StimBasePackImpl implements _StimBasePack {
  _StimTypeScopeImpl _type;
  _StimFieldScopeImpl _field;

  @override
  _StimFieldScope get field => _field;

  @override
  _StimTypeScope get type => _type;

  _StimBasePackImpl() {
    // Notes that need to do 2 phase init to avoid cyclic dependency.
    _type = _StimTypeScopeImpl._(this);
    _field = _StimFieldScopeImpl._(this);

    _type.init();
    _field.init();
  }
}
