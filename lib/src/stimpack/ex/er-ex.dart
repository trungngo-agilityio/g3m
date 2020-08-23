part of g3.stimpack.ex;

class ErRelationCardinalScopeEx extends ErRelationCardinalScope {
  ErRelationCardinal one, optional, oneOrMore, zeroOrMore;

  ErRelationCardinalScopeEx() {
    one = call('one')
      ..min = 1
      ..max = 1;

    optional = call('optional')
      ..min = 0
      ..max = 1;

    oneOrMore = call('one or more')..min = 1;

    zeroOrMore = call('zero or more')..min = 0;
  }
}

class ErRelationTypeScopeEx extends ErRelationTypeScope {
  final ErRelationCardinalScopeEx _cardinal;
  ErRelationType hasOne, hasMany, hasOptional, own;

  ErRelationTypeScopeEx(this._cardinal) : super(_cardinal) {
    var c = _cardinal;

    hasOne = call('has one', from: c.one, to: c.one);
    hasOptional = call('has optional', from: c.one, to: c.optional);
    hasMany = call('has many', from: c.one, to: c.zeroOrMore);
    own = hasOne ^ 'own';
  }
}

class ErRelationScopeEx extends ErRelationScope {
  final ErRelationTypeScopeEx _type;
  @override
  final ModelScopeEx model;

  final FieldScopeEx field;

  ErRelationScopeEx(this.model, this._type)
      : field = model._field,
        super(model, _type) {
    // a user has exact one user profile.
    call(model.user, _type.hasOne, model.userProfile);
  }

  /// Overrides the original behavior to automatically create foreign key(s)
  /// when new relation added.
  ///
  @override
  ErRelation call(Model from, ErRelationType type, Model to) {
    var res = super.call(from, type, to);

    for (var fromEl in res.from.eval()) {
      for (var toEl in res.to.eval()) {
        for (var typeEl in type.eval()) {
          var fc = typeEl.from;

          if (fc.max != null && fc.max == 1) {
            // There is max 1 "fromEl" entity.
            // So we need to add a foreign key to the "toEl" model.
            var fromId = fromEl[field.id];
            toEl.fields += fromId;
          }
        }
      }
    }

    return res;
  }
}
