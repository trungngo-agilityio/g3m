part of g3m.ex;

class StoryScopeEx extends StoryScope {
  final StoryActorScopeEx _actor;

  final StoryActionScopeEx _action;

  final ModelScopeEx _model;

  final DbTableScopeEx _table;

  StoryScopeEx(this._actor, this._action, this._model, this._table)
      : super(_actor, _action, _model, _table) {
    _buildAuth();
  }

  void _buildAuth() {
    var a = _action;
    var m = _model;
    var f = _model._field;
    var t = _table;

    // -------------------------------------------------------------------------
    // Guest
    // -------------------------------------------------------------------------
    var guest = _actor.guest;

    // Guest user can sign in with email/password credential
    var s1 = call(guest, (a.signIn + a.signUp) >> 'with email and password')
      ..request = f.email + f.password;

    // Guest user can sign in with username/password credential
    var s2 = call(guest, (a.signIn + a.signUp) >> 'with username and password')
      ..request = f.username + f.password;

    s1.request = s1.request.required();

    // Response for all successfully sign in
    s1 + s2
      ..response = m.oauthToken.fields.required() +
          f.id +
          f.name +
          f.email +
          f.avatarUrl;

    call(guest, a.reset << 'password');

    // -------------------------------------------------------------------------
    // User
    // -------------------------------------------------------------------------

    var user = _actor.user;
    // A login in user can sign out
    call(user, a.signOut);

    // User can update password, email , phone separately
    call(user, a.update >> f.password)
      ..request = f.password + f.confirmPassword;

    // User can update his email, with the specified password.
    call(user, a.update >> f.email)
      ..request = f.email + f.password
      ..response = f.emailVerified;

    // User can update his phone, with the specified password
    call(user, a.update >> f.phone)
      ..request = f.phone + f.password
      ..response = f.phoneVerified;

    // User can update his owns profile
    call(user, a.update >> 'profile')
      ..request = m.userProfile.fields - f.username - f.password
      ..table = t.userProfile;
  }
}
