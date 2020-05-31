part of g3m.core;

class ErRelationCardinal extends Expr<ErRelationCardinal> {
  @override
  final ErRelationCardinalScope _scope;

  // region min

  /// Nullable internal min value.
  int _min;

  /// Gets the current min constraint.
  /// In the case that this is a set of constraints, the min
  /// value should be the max of all min values.
  int get min {
    if (_min != null) return _min;
    return eval().map((e) => e._min).reduce(math.max);
  }

  /// Sets the current min constraint.
  /// In the case that this is a set of constraints, the min value
  /// would be applied to all sub constraints.
  ///
  set min(int value) {
    _min = value;
    eval().forEach((e) {
      if (e._min == null) {
        // if the min is not define, get the current value.
        e._min = value;
      } else {
        // If the min is define, the new min is the minimum
        // of the current one and the previous one.
        e._min = math.max(e._min, value);
      }
    });
  }

  // endregion

  // region max

  /// Nullable internal max value.
  int _max;

  /// Gets the current max constraint.
  /// In the case that this is a set of constraints, the max
  /// value should be the minimum of all max values.
  int get max {
    if (_max != null) return _max;
    return eval().map((e) => e._max).reduce(math.min);
  }

  /// Sets the current maximum constraint.
  /// In the case that this is a set of constraints, the new maximum value
  /// would be applied to all sub constraints.
  ///
  set max(int value) {
    _max = value;
    eval().forEach((e) {
      if (e._max == null) {
        // if the min is not define, get the current value.
        e._max = value;
      } else {
        // If the min is define, the new min is the minimum
        // of the current one and the previous one.
        e._max = math.min(e._max, value);
      }
    });
  }

  // endregion

  ErRelationCardinal(this._scope) : super(_scope);
}

class ErRelationCardinalScope extends Scope<ErRelationCardinal> {
  ErRelationCardinalScope();

  @override
  ErRelationCardinal make() => ErRelationCardinal(this);

  ErRelationCardinal call(String name, {int min, int max}) {
    return add(name)
      .._min = min
      .._max = max;
  }
}
