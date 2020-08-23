part of g3.stimpack.core;

class Constraint extends Expr<Constraint> {
  Constraint(ConstraintScope scope) : super(scope);

  Pattern _pattern;

  Pattern get pattern => _pattern;

  set pattern(Pattern value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._pattern = value;
    }
  }

  // region required

  bool _required;

  bool get required => _required;

  set required(bool value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._required = value;
    }
  }

  // endregion

  // region unique

  bool _unique;

  bool get unique => _unique;

  set unique(bool value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._unique = value;
    }
  }

  // endregion

  // region min

  /// Nullable internal min value.
  int _min;

  /// Gets the current min constraint.
  /// In the case that this is a set of constraints, the min
  /// value should be the max of all min values.
  int get min => _min;

  /// Sets the current min constraint.
  /// In the case that this is a set of constraints, the min value
  /// would be applied to all sub constraints.
  ///
  set min(int value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._min = value;
    }
  }

  // endregion

  // region max

  /// Nullable internal max value.
  int _max;

  /// Gets the current max constraint.
  /// In the case that this is a set of constraints, the max
  /// value should be the minimum of all max values.
  int get max => _max;

  /// Sets the current maximum constraint.
  /// In the case that this is a set of constraints, the new maximum value
  /// would be applied to all sub constraints.
  ///
  set max(int value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._max = value;
    }
  }

  // endregion

  @override
  Constraint clone() => super.clone()
    .._required = _required
    .._unique = _unique
    .._min = _min
    .._max = _max
    .._pattern = _pattern;

  @override
  bool _isValid() =>
      _pattern.isEmptyOrValidSet &&
      (_min == null || _max == null || _min <= _max);
}

class ConstraintScope extends Scope<Constraint> {
  final PatternScope _pattern;

  ConstraintScope(this._pattern);

  @override
  Constraint make() => Constraint(this)
    .._pattern = _pattern.none
    .._required = false
    .._unique = false;

  /// Creates a new [Constraint] with
  /// - [min] is the minimum constraint applied (e.g., minimum number values)
  /// - [max] is the maximum constraint applied (e.g., maximum number values)
  /// - [required] is true when that the related value must be required.
  /// - [unique] is true when the related value will be unique somehow in its scope.
  /// - [pattern] is the string pattern applied to the constraint.
  ///
  Constraint call(String name,
      {int min,
      int max,
      bool required = false,
      bool unique = false,
      Pattern pattern}) {
    return add(name)
      .._required = required
      .._unique = unique
      .._min = min
      .._max = max
      .._pattern += pattern;
  }
}
