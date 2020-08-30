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
  final _StimModelFieldScopeImpl _scope;

  StimModelFieldXTypeOp _type;

  StimModelFieldXRulesSetOp _rules;

  StimModelFieldXTypeOp get type {
    return _type ??= StimModelFieldXTypeOp(this, stimpack.model.type);
  }

  set type(StimModelFieldXTypeOp value) {
    _type = value;
  }
  StimModelFieldXRulesSetOp get rules {
    return _rules ??= StimModelFieldXRulesSetOp(this, stimpack.model.rule);
  }

  set rules(StimModelFieldXRulesSetOp value) {
    _rules = value;
  }
  StimModelFieldSet(this._scope, List<StimModelField> items):
      super(_scope, items);
}


abstract class StimModelFieldScope extends StimScope<StimModelField, StimModelFieldSet> {
  StimModelField get userId;
  StimModelField get username;
  StimModelField get email;
  StimModelField get emailVerified;
  StimModelField get phone;
  StimModelField get phoneVerified;
  StimModelField get password;
  StimModelField get confirmPassword;
  StimModelField get name;
  StimModelField get desc;
  StimModelField get firstName;
  StimModelField get lastName;
  StimModelField get middleName;
  StimModelField get gender;
  StimModelField get birthday;
  StimModelField get photoUrl;
  StimModelField get avatarUrl;
  StimModelField get total;
  StimModelField get count;
  StimModelField get size;
  StimModelField get index;
  StimModelField get pageSize;
  StimModelField get pageIndex;
  StimModelField get offset;
  StimModelField get limit;
  StimModelField get id;
  StimModelField get createdAt;
  StimModelField get modifiedAt;
  StimModelField get version;
  StimModelField get accessToken;
  StimModelField get refreshToken;
  StimModelField get expiredIn;

  StimModelField of(name, {dynamic type, dynamic rules});
}


class _StimModelFieldScopeImpl extends StimScopeImpl<StimModelField, StimModelFieldSet> implements StimModelFieldScope {
  StimModelField _userId;

  StimModelField _username;

  StimModelField _email;

  StimModelField _emailVerified;

  StimModelField _phone;

  StimModelField _phoneVerified;

  StimModelField _password;

  StimModelField _confirmPassword;

  StimModelField _name;

  StimModelField _desc;

  StimModelField _firstName;

  StimModelField _lastName;

  StimModelField _middleName;

  StimModelField _gender;

  StimModelField _birthday;

  StimModelField _photoUrl;

  StimModelField _avatarUrl;

  StimModelField _total;

  StimModelField _count;

  StimModelField _size;

  StimModelField _index;

  StimModelField _pageSize;

  StimModelField _pageIndex;

  StimModelField _offset;

  StimModelField _limit;

  StimModelField _id;

  StimModelField _createdAt;

  StimModelField _modifiedAt;

  StimModelField _version;

  StimModelField _accessToken;

  StimModelField _refreshToken;

  StimModelField _expiredIn;

  StimModelType type;

  StimModelRuleSet rules;

  @override
  StimModelField get userId {
    return _userId ??= of('user id');
  }
  @override
  StimModelField get username {
    return _username ??= of('username');
  }
  @override
  StimModelField get email {
    return _email ??= of('email');
  }
  @override
  StimModelField get emailVerified {
    return _emailVerified ??= of('email verified');
  }
  @override
  StimModelField get phone {
    return _phone ??= of('phone');
  }
  @override
  StimModelField get phoneVerified {
    return _phoneVerified ??= of('phone verified');
  }
  @override
  StimModelField get password {
    return _password ??= of('password');
  }
  @override
  StimModelField get confirmPassword {
    return _confirmPassword ??= of('confirm password');
  }
  @override
  StimModelField get name {
    return _name ??= of('name');
  }
  @override
  StimModelField get desc {
    return _desc ??= of('desc');
  }
  @override
  StimModelField get firstName {
    return _firstName ??= of('first name');
  }
  @override
  StimModelField get lastName {
    return _lastName ??= of('last name');
  }
  @override
  StimModelField get middleName {
    return _middleName ??= of('middle name');
  }
  @override
  StimModelField get gender {
    return _gender ??= of('gender');
  }
  @override
  StimModelField get birthday {
    return _birthday ??= of('birthday');
  }
  @override
  StimModelField get photoUrl {
    return _photoUrl ??= of('photo url');
  }
  @override
  StimModelField get avatarUrl {
    return _avatarUrl ??= of('avatar url');
  }
  @override
  StimModelField get total {
    return _total ??= of('total');
  }
  @override
  StimModelField get count {
    return _count ??= of('count');
  }
  @override
  StimModelField get size {
    return _size ??= of('size');
  }
  @override
  StimModelField get index {
    return _index ??= of('index');
  }
  @override
  StimModelField get pageSize {
    return _pageSize ??= of('page size');
  }
  @override
  StimModelField get pageIndex {
    return _pageIndex ??= of('page index');
  }
  @override
  StimModelField get offset {
    return _offset ??= of('offset');
  }
  @override
  StimModelField get limit {
    return _limit ??= of('limit');
  }
  @override
  StimModelField get id {
    return _id ??= of('id');
  }
  @override
  StimModelField get createdAt {
    return _createdAt ??= of('created at');
  }
  @override
  StimModelField get modifiedAt {
    return _modifiedAt ??= of('modified at');
  }
  @override
  StimModelField get version {
    return _version ??= of('version');
  }
  @override
  StimModelField get accessToken {
    return _accessToken ??= of('access token');
  }
  @override
  StimModelField get refreshToken {
    return _refreshToken ??= of('refresh token');
  }
  @override
  StimModelField get expiredIn {
    return _expiredIn ??= of('expired in');
  }
  _StimModelFieldScopeImpl():
      super();


  @override
  StimModelField of(name, {dynamic type, dynamic rules}) {
    return createAndClear(name)
        ..type = type ?? stimpack.model.type.none
        ..rules += rules ?? stimpack.model.rule.noneSet;
  }

  @override
  void clear(StimModelField symbol) {
    symbol
        ..type = stimpack.model.type.none
        ..rules = stimpack.model.rule.noneSet;
  }

  @override
  StimModelField create() {
    return StimModelField(this);
  }

  @override
  StimModelFieldSet createSet(List<StimModelField> items) {
    return StimModelFieldSet(this, items);
  }
}
