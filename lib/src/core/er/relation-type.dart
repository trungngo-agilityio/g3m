part of g3m.core;

class ErRelationType extends Expr<ErRelationType> {
  ErRelationType(ErRelationTypeScope scope) : super(scope);

  ErRelationCardinal _from;

  ErRelationCardinal get from => _from;

  set from(value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._from = value;
    }
  }

  ErRelationCardinal _to;

  ErRelationCardinal get to => _to;

  set to(value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._to = value;
    }
  }

  @override
  ErRelationType clone() => super.clone()
    .._from = _from
    .._to = _to;

  @override
  bool _isValid() => _from.isEmptyOrValidSet && _to.isEmptyOrValidSet;
}

class ErRelationTypeScope extends Scope<ErRelationType> {
  final ErRelationCardinalScope _cardinal;

  ErRelationTypeScope(this._cardinal);

  @override
  ErRelationType make() => ErRelationType(this)
    ..from = _cardinal.none
    ..to = _cardinal.none;

  ErRelationType call(String name,
      {ErRelationCardinal from, ErRelationCardinal to}) {
    return add(name)
      .._from = from
      .._to = to;
  }
}
