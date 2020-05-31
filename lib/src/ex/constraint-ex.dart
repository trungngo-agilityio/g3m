part of g3m.ex;

class ConstraintScopeEx extends ConstraintScope with ConstraintMixin {
  ConstraintScopeEx(PatternScopeEx pattern) : super(pattern) {
    buildConstraint(this, pattern);
  }
}

mixin ConstraintMixin {
  void buildConstraint(ConstraintScope constraint, PatternMixin pattern) {
    _buildTexts(constraint);
    _buildPatterns(constraint, pattern);
  }

  Constraint required, unique;

  Constraint name, email, username, phone, password, url;

  // -------------------------------------------------------------------------
  // Patterns
  // -------------------------------------------------------------------------
  void _buildPatterns(ConstraintScope c, PatternMixin p) {
    required = c('required')..required = true;
    unique = c('unique')..unique = true;

    email = c('email')
      ..max = 250
      ..pattern = p.email;

    username = c('username')
      ..min = 8
      ..max = 30
      ..pattern = p.username;

    phone = c('phone')
      ..min = 8
      ..max = 30
      ..pattern = p.username;

    password = c('password')
      ..min = 8
      ..max = 30
      ..pattern = p.password;

    url = c('url')
      ..max = 500
      ..pattern = p.url;
  }

  // -------------------------------------------------------------------------
  // Text
  // -------------------------------------------------------------------------
  Constraint shortText, text, longText;

  void _buildTexts(ConstraintScope c) {
    shortText = c('short text')..max = 50;

    text = c('text')..max = 100;

    longText = c('long text')..max = 250;
  }
}
