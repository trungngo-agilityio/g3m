part of g3.stimpack.ex;

class ModelScopeEx extends ModelScope with AuthModelMixin {
  final FieldScopeEx _field;

  ModelScopeEx(this._field) : super(_field) {
    buildAuthModel(this, _field, _field, _field);
  }

  /// Override the original behavior to
  @override
  Model call(String name, {Field fields}) {
    var res = super.call(name, fields: fields);
    for (var e in res.eval()) {
      // Just add in some fields that should be there for all models.
      e.fields +=
          _field.id + _field.createdAt + _field.modifiedAt + _field.version;
    }
    return res;
  }
}

mixin AuthModelMixin {
  Model user, userProfile;
  Model oauthToken;

  void buildAuthModel(ModelScope m, CommonFieldMixin fc, ProfileFieldMixin fp,
      OAuthFieldMixin fo) {
    user = m('user', fields: fc.id + fp.name);

    userProfile = m('user profile',
        fields: fp.firstName +
            fp.lastName +
            fp.middleName +
            fp.username +
            fp.gender +
            fp.birthday +
            fp.photoUrl +
            fp.avatarUrl +
            fp.email +
            fp.emailVerified +
            fp.phone +
            fp.phoneVerified);

    oauthToken = m('oauth token',
        fields: fo.accessToken + fo.refreshToken + fo.expireIn);
  }
}
