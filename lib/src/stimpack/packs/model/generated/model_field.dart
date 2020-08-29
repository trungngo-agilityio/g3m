part of g3.stimpack.model.generated;

class StimModelField extends StimSymbol<StimModelField, StimModelFieldSet > {
  StimModelType type;
  StimModelRuleSet rules;

  StimModelField._(_StimModelFieldScopeImpl scope)
      : super(scope);

  @override
  StimModelField clone() {
    return super.clone()
      ..type = type.clone()
      ..rules = rules.clone();    
  }
}

class StimModelFieldSet
    extends StimSymbolSet<StimModelField, StimModelFieldSet> {
  final _StimModelModelImpl __pack;

  
  StimModelFieldSet._(this.__pack, List<StimModelField> items)
      : super(__pack._field, items);

         
         
  StimModelFieldXTypeSetOp _type;

  StimModelFieldXTypeSetOp get type =>
      _type ??= StimModelFieldXTypeSetOp(this, __pack.type);

  set type(StimModelFieldXTypeSetOp value) => _type = value;
                
        
  StimModelFieldXRulesSetOp _rules;

  StimModelFieldXRulesSetOp get rule =>
      _rules ??= StimModelFieldXRulesSetOp(this, __pack.rule);

  set rules(StimModelFieldXRulesSetOp value) => _rules = value;
        
}

abstract class StimModelFieldScope
    extends StimScope<StimModelField, StimModelFieldSet> {
    
  StimModelFieldSymbols get s;
    
  StimModelField of(dynamic name, {dynamic type, dynamic rules});
}


class StimModelFieldUserPreset {
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

  StimModelFieldSet all;


  StimModelFieldUserPreset(StimModelFieldScope scope) {
    userId = scope.of('user id');
    userName = scope.of('user name');
    email = scope.of('email');
    emailVerified = scope.of('email verified');
    phone = scope.of('phone');
    phoneVerified = scope.of('phone verified');
    password = scope.of('password');
    confirmPassword = scope.of('confirm password');
    name = scope.of('name');
    desc = scope.of('desc');
    firstName = scope.of('first name');
    lastName = scope.of('last name');
    middleName = scope.of('middle name');
    gender = scope.of('gender');
    birthday = scope.of('birthday');
    photoUrl = scope.of('photo url');
    avatarUrl = scope.of('avatar url');
  }
}

class StimModelFieldPaginationPreset {
  StimModelField total;

  StimModelField count;

  StimModelField size;

  StimModelField index;

  StimModelField pageSize;

  StimModelField pageIndex;

  StimModelField offset;

  StimModelField limit;

  StimModelFieldSet all;


  StimModelFieldPaginationPreset(StimModelFieldScope scope) {
    total = scope.of('total');
    count = scope.of('count');
    size = scope.of('size');
    index = scope.of('index');
    pageSize = scope.of('page size');
    pageIndex = scope.of('page index');
    offset = scope.of('offset');
    limit = scope.of('limit');
  }
}

class StimModelFieldDbPreset {
  StimModelField id;

  StimModelField createdAt;

  StimModelField modifiedAt;

  StimModelField version;

  StimModelFieldSet all;


  StimModelFieldDbPreset(StimModelFieldScope scope) {
    id = scope.of('id');
    createdAt = scope.of('created at');
    modifiedAt = scope.of('modified at');
    version = scope.of('version');
  }
}

        
class StimModelFieldSymbols {
  final _StimModelFieldScopeImpl _scope;
  /// All symbols
  StimModelFieldSet all;
  StimModelFieldUserPreset _user;

  StimModelFieldUserPreset get user {
    return _user ??= StimModelFieldUserPreset(_scope);
  }
  StimModelFieldPaginationPreset _pagination;

  StimModelFieldPaginationPreset get pagination {
    return _pagination ??= StimModelFieldPaginationPreset(_scope);
  }
  StimModelFieldDbPreset _db;

  StimModelFieldDbPreset get db {
    return _db ??= StimModelFieldDbPreset(_scope);
  }
  
  StimModelFieldSymbols(this._scope) {
    final _s = stimpack.model.field;
    all = _s.noneSet;

  }
}

class _StimModelFieldScopeImpl 
    extends StimScopeImpl<StimModelField, StimModelFieldSet>
    implements StimModelFieldScope {
  final _StimModelModelImpl __pack;
  
  _StimModelFieldScopeImpl._(this.__pack) : super();

  StimModelFieldSymbols _s;

  @override
  StimModelFieldSymbols get s => _s ??= StimModelFieldSymbols(this);
  @override
  void clear(StimModelField symbol) {
    symbol
      ..type = __pack.type.none
      ..rules = __pack.rule.noneSet;    
  }

  @override
  StimModelField create() => StimModelField._(this);

  @override
  StimModelField of(dynamic name, {dynamic type, dynamic rules}) {
    return createAndClear(name)
      ..type = type ?? __pack.type.none
      ..rules += rules ?? __pack.rule.noneSet;    
  }

  @override
  StimModelFieldSet createSet(List<StimModelField> items) {
    return StimModelFieldSet._(__pack, items);
  }
}
    