part of g3.stimpack.ex;

class PatternScopeEx extends PatternScope with PatternMixin {
  PatternScopeEx() {
    buildPattern(this);
  }
}

mixin PatternMixin {
  Pattern id,
      uuidV4,
      slug,
      ipv4,
      ipv6,
      ip,
      url,
      email,
      username,
      password,
      phone;

  void buildPattern(PatternScope pattern) {
    id = pattern('id');
    uuidV4 = pattern('uuid v4');
    slug = pattern('slug');

    ipv4 = pattern('ipv4');
    ipv6 = pattern('ipv6');
    ip = ipv4 + ipv6;

    url = pattern('url');
    email = pattern('email');
    username = pattern('username');
    password = pattern('password');
    phone = pattern('phone');
  }
}
