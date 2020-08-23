part of g3.stimpack.core;

class ErRelation extends Expr<ErRelation> {
  @override
  final ErRelationScope _scope;

  // ---------------------------------------------------------------------------
  // Type
  // ---------------------------------------------------------------------------
  ErRelationType _type;

  ErRelationType get type => _type;

  // ---------------------------------------------------------------------------
  // From
  // ---------------------------------------------------------------------------
  Model _from;

  Model get from => _from;

  // ---------------------------------------------------------------------------
  // To
  // ---------------------------------------------------------------------------
  Model _to;

  Model get to => _to;

  ErRelation(this._scope) : super(_scope);

  @override
  ErRelation clone() => super.clone()
    .._type = _type
    .._from = _from
    .._to = _to;
}

class ErRelationScope extends Scope<ErRelation> {
  final ModelScope _model;
  final ErRelationTypeScope _type;

  ErRelationScope(this._model, this._type);

  @override
  ErRelation make() => ErRelation(this)
    .._from = _model.none
    .._to = _model.none
    .._type = _type.none;

  /// Adds a new relation between 2 models.
  ///
  ErRelation call(Model from, ErRelationType type, Model to) {
    assert(from != null, 'from argument required');
    assert(to != null, 'to argument required');
    assert(type != null, 'type argument required');

    var res = none;

    for (var i in from.eval()) {
      for (var j in to.eval()) {
        for (var k in type.eval()) {
          // The relation name. E.g., "user has one user profile".
          var name = i.name & k.name & j.name;
          res += add(name)
            .._type += type
            .._from += from
            .._to += to;
        }
      }
    }

    res._from += from;
    res._to += to;
    res._type += type;

    return res;
  }
}
