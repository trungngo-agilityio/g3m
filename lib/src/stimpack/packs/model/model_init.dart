part of g3.stimpack.model.generated;

/// This function is called during the initialization of model
void stimInitModelPack(StimModel pack) {
  StimModelPackInit(pack);
}

class StimModelPackInit {
  final StimModel pack;

  StimModelPackInit(this.pack) {
    _initPatterns();
    _initRules();
    _initFieldTypes();
    _initFieldRules();
    _initModelFields();
    _initPackages();
  }

  void _initPatterns() {}

  void _initRules() {
    // maps the rule and pattern that have the same name.
    final r = pack.rule, p = pack.pattern;
    _mapRulePatterns({
      r.id: p.id,
      r.uuidV4: p.uuidV4,
      r.slug: p.slug,
      r.ipv4: p.ipv4,
      r.ipv6: p.ipv6,
      r.ip: p.ip,
      r.url: p.url,
      r.email: p.email,
      r.username: p.username,
      r.password: p.password,
      r.phone: p.phone,
      r.alpha: p.alpha,
    });
  }

  void _mapRulePatterns(Map<StimModelRule, StimModelPattern> map) {
    for (final i in map.entries) {
      i.key.patterns += i.value;
    }
  }

  void _initFieldTypes() {
    final f = pack.field, t = pack.type;

    // user profiles
    f.emailVerified + f.phoneVerified
      ..type.set(t.bool);

    f.total +
        f.count +
        f.size +
        f.index +
        f.pageSize +
        f.pageIndex +
        f.offset +
        f.limit
      ..type.set(t.int32);

    // Sets up all string type.
    // db fields
    f.id +
        f.version +
        // user profiles
        f.userId +
        f.username +
        f.email +
        f.phone +
        f.password +
        f.name +
        f.desc +
        f.firstName +
        f.lastName +
        f.middleName +
        f.photoUrl +
        f.avatarUrl +
        // auth fields
        f.accessToken +
        f.refreshToken
      ..type.set(t.string);

    // db fields
    f.createdAt + f.modifiedAt
      ..type.set(t.timestamp);

    f.birthday.type = t.localDate;
  }

  void _initFieldRules() {
    final f = pack.field, r = pack.rule;
    f.id + f.userId
      ..rules += r.id;

    f.username.rules += r.username;
    f.email.rules += r.email;
    f.phone.rules += r.phone;
    f.password.rules += r.password;
    f.name + f.firstName + f.lastName + f.middleName
      ..rules.set(r.humanName);
    f.photoUrl + f.avatarUrl
      ..rules.set(r.url);
    f.birthday.rules += r.birthDay;
  }

  void _initModelFields() {
    final t = pack.type, f = pack.field;

    t.user.fields = f.userId + f.username;

    t.userProfile.fields = f.id +
        f.username +
        f.email +
        f.emailVerified +
        f.phone +
        f.phoneVerified +
        f.firstName +
        f.lastName +
        f.middleName +
        f.gender +
        f.birthday +
        f.photoUrl +
        f.avatarUrl;

    t.accessToken.fields = f.accessToken + f.refreshToken + f.expiredIn;

    t.apiPage.fields += f.total + f.count + f.pageSize + f.pageIndex;
    t.apiOffsetLimit.fields += f.offset + f.limit + f.total;
  }

  void _initPackages() {
    final p = pack.package, t = pack.type;

    // primitive types package
    p.primitive.types += t.double +
        t.float +
        t.int32 +
        t.int64 +
        t.uint32 +
        t.uint64 +
        t.sint32 +
        t.sint64 +
        t.fixed32 +
        t.fixed64 +
        t.sfixed32 +
        t.sfixed64 +
        t.bool +
        t.string +
        t.bytes;
  }
}
