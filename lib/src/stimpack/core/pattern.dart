part of g3.stimpack.core;

// region Pattern

class Pattern extends Expr<Pattern> {
  Pattern(PatternScope scope) : super(scope);
}

class PatternScope extends Scope<Pattern> {
  @override
  Pattern make() => Pattern(this);

  Pattern call(String name) {
    return add(name);
  }
}

// endregion
