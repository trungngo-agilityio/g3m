part of g3.stimpack.ex;

class FieldScopeEx extends FieldScope
    with CommonFieldMixin, OAuthFieldMixin, ProfileFieldMixin {
  FieldScopeEx(DataTypeScopeEx type, ConstraintScopeEx constraint)
      : super(type, constraint) {
    buildCommonFields(this, type, type);
    buildOAuthField(this, type);
    buildProfileField(this, this, type, type, constraint);
  }
}

mixin CommonFieldMixin {
  // --------------------------------------------------------------------------
  // System Fields
  // --------------------------------------------------------------------------

  Field id;
  Field createdAt;
  Field modifiedAt;
  Field version;

  Field total;
  Field count;
  Field size;
  Field index;
  Field pageSize;
  Field pageIndex;
  Field offset;
  Field limit;

  void buildCommonFields(
      FieldScope f, GrpcDataTypeMixin t, CommonDataTypeMixin tc) {
    id = f('id', t.string);

    createdAt = f('created at', tc.timestamp);
    modifiedAt = f('modified at', tc.timestamp);
    version = f('version', t.uint32);

    total = f('total', t.uint32);
    count = f('count', t.uint32);
    size = f('size', t.uint32);
    index = f('index', t.uint32);
    pageIndex = f('page index', t.uint32);
    pageSize = f('page size', t.uint32);
    offset = f('offset', t.uint32);
    limit = f('limit', t.uint32);
  }
}

mixin OAuthFieldMixin {
  // --------------------------------------------------------------------------
  // OAuth fields
  // --------------------------------------------------------------------------
  Field accessToken, refreshToken, expireIn;

  void buildOAuthField(FieldScope f, GrpcDataTypeMixin t) {
    accessToken = f('access token', t.string);
    refreshToken = f('refresh token', t.string);
    expireIn = f('expire in', t.uint32);
  }
}

mixin ProfileFieldMixin {
  // --------------------------------------------------------------------------
  // Common Fields
  // --------------------------------------------------------------------------
  Field userId;
  Field username;
  Field email;
  Field emailVerified;
  Field phone;
  Field phoneVerified;

  Field password;
  Field confirmPassword;

  Field name;
  Field desc;

  Field firstName;
  Field lastName;
  Field middleName;

  Field gender;
  Field birthday;

  Field photoUrl;
  Field avatarUrl;

  void buildProfileField(FieldScope f, CommonFieldMixin fc, GrpcDataTypeMixin t,
      CommonDataTypeMixin tc, ConstraintMixin c) {
    assert(f != null);
    assert(fc != null);
    assert(t != null);
    assert(tc != null);
    assert(c != null);

    userId = fc.id >> 'user';
    username = f('username', t.string, c.username);

    email = f('email', t.string, c.email);
    emailVerified = f('email verified', t.bool);

    phone = f('phone', t.string, c.phone);
    phoneVerified = f('phone verified', t.bool);

    password = f('password', t.string, c.password);
    confirmPassword = password >> 'confirm';

    name = f('name', t.string, c.text);
    desc = f('desc', t.string, c.longText);

    firstName = f('first name', t.string, c.shortText);
    lastName = f('last name', t.string, c.shortText);
    middleName = f('middle name', t.string, c.shortText);

    gender = f('gender', t.string);

    birthday = f('birthday', tc.localDate);

    photoUrl = f('photo url', t.string, c.url);
    avatarUrl = f('avatar url', t.string, c.url);
  }
}

extension FieldConstrainExtension on Field {
  // Todo make it work with collection
  Field required() {
    var c = constraints.scope as ConstraintScopeEx;
    return clone()..constraints += c.required;
  }

  Field unique() {
    var c = constraints.scope as ConstraintScopeEx;
    return clone()..constraints += c.unique;
  }
}
