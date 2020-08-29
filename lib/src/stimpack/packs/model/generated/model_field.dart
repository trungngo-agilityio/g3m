part of g3.stimpack.model.generated;



class StimModelField extends StimSymbol<StimModelField, StimModelFieldSet> {
  StimModelType type;

  StimModelRuleSet rules;

  StimModelField(_StimModelFieldScopeImpl scope):
      super(scope);


  @override
  StimModelField clone() {
    return super.clone()
        ..type = type.clone()
        ..rules = rules.clone();
  }
}


class StimModelFieldSet extends StimSymbolSet<StimModelField, StimModelFieldSet> {
  final _StimModelModelImpl _pack;

  StimModelFieldXTypeOp _type;

  StimModelFieldXRulesSetOp _rules;

  StimModelFieldXTypeOp get type {
    return _type ??= StimModelFieldXTypeOp(this, _pack.type);
  }

  set type(StimModelFieldXTypeOp value) {
    _type = value;
  }
  StimModelFieldXRulesSetOp get rules {
    return _rules ??= StimModelFieldXRulesSetOp(this, _pack.rule);
  }

  set rules(StimModelFieldXRulesSetOp value) {
    _rules = value;
  }
  StimModelFieldSet(this._pack, List<StimModelField> items):
      super(_pack._field, items);
}


abstract class StimModelFieldScope extends StimScope<StimModelField, StimModelFieldSet> {
  StimModelFieldSymbols get s;

  StimModelField of(name, {dynamic type, dynamic rules});
}


class _StimModelFieldScopeImpl extends StimScopeImpl<StimModelField, StimModelFieldSet> implements StimModelFieldScope {
  final _StimModelModelImpl _pack;

  StimModelFieldSymbols _s;

  StimModelType type;

  StimModelRuleSet rules;

  @override
  StimModelFieldSymbols get s {
    return _s ??= StimModelFieldSymbols(this);
  }
  _StimModelFieldScopeImpl(this._pack):
      super();


  @override
  StimModelField of(name, {dynamic type, dynamic rules}) {
    return createAndClear(name)
        ..type = type ?? _pack.type.none
        ..rules += rules ?? _pack.rule.noneSet;
  }

  @override
  void clear(StimModelField symbol) {
    symbol
        ..type = _pack.type.none
        ..rules = _pack.rule.noneSet;
  }

  @override
  StimModelField create() {
    return StimModelField(this);
  }

  @override
  StimModelFieldSet createSet(List<StimModelField> items) {
    return StimModelFieldSet(_pack, items);
  }
}


class StimModelFieldSymbols {
  StimModelFieldSet all;


  StimModelFieldSymbols(StimModelFieldScope scope) {
    all = scope.noneSet;
  }
}


class StimModelFieldUserPreset {
  StimModelFieldSet all;

  StimModelField userId;

  StimModelField userName;

  StimModelField email;

  StimModelField emailVerified;

  StimModelField phone;

  StimModelField phoneVerified;

  StimModelField password;

  StimModelField confirmPassword;

  StimModelField name;

  StimModelField desc;

  StimModelField firstName;

  StimModelField lastName;

  StimModelField middleName;

  StimModelField gender;

  StimModelField birthday;

  StimModelField photoUrl;

  StimModelField avatarUrl;


  StimModelFieldUserPreset(StimModelFieldScope scope) {
    all = scope.noneSet;
    all += userId = scope.of('user id');
    all += userName = scope.of('user name');
    all += email = scope.of('email');
    all += emailVerified = scope.of('email verified');
    all += phone = scope.of('phone');
    all += phoneVerified = scope.of('phone verified');
    all += password = scope.of('password');
    all += confirmPassword = scope.of('confirm password');
    all += name = scope.of('name');
    all += desc = scope.of('desc');
    all += firstName = scope.of('first name');
    all += lastName = scope.of('last name');
    all += middleName = scope.of('middle name');
    all += gender = scope.of('gender');
    all += birthday = scope.of('birthday');
    all += photoUrl = scope.of('photo url');
    all += avatarUrl = scope.of('avatar url');
  }
}


class StimModelFieldPaginationPreset {
  StimModelFieldSet all;

  StimModelField total;

  StimModelField count;

  StimModelField size;

  StimModelField index;

  StimModelField pageSize;

  StimModelField pageIndex;

  StimModelField offset;

  StimModelField limit;


  StimModelFieldPaginationPreset(StimModelFieldScope scope) {
    all = scope.noneSet;
    all += total = scope.of('total');
    all += count = scope.of('count');
    all += size = scope.of('size');
    all += index = scope.of('index');
    all += pageSize = scope.of('page size');
    all += pageIndex = scope.of('page index');
    all += offset = scope.of('offset');
    all += limit = scope.of('limit');
  }
}


class StimModelFieldDbPreset {
  StimModelFieldSet all;

  StimModelField id;

  StimModelField createdAt;

  StimModelField modifiedAt;

  StimModelField version;


  StimModelFieldDbPreset(StimModelFieldScope scope) {
    all = scope.noneSet;
    all += id = scope.of('id');
    all += createdAt = scope.of('created at');
    all += modifiedAt = scope.of('modified at');
    all += version = scope.of('version');
  }
}
