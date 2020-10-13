part of g3.stimpack.core;

extension StimSetExtension<T> on Set<T> {
  Set<T> clone() {
    return Set<T>.of(this);
  }

  Set<T> operator +(dynamic other) {
    if (this == null) {
      if (other == null) return null;
      if (other is T) return {other};
      if (other is Iterable<T>) return Set.of(other);
    }
    if (other == null) return Set.of(this);
    if (other is T) return Set.of(this)..add(other);
    if (other is Iterable<T>) return Set.of(this)..addAll(other);

    throw 'cannot add ${other.runtimeType} to a set of $T';
  }

  /// Removes a symbol out of a set.
  ///
  /// If a set is null or empty, then just return an empty set
  /// a result. Otherwise, make sure the other is a T or set of T,
  /// remove it out of the set, and the return.
  ///
  Set<T> operator -(dynamic other) {
    if (isNotEmpty != true) {
      return {};
    } else if (other == null) {
      return Set.of(this);
    } else if (other is T) {
      return Set.of(this)..remove(other);
    } else if (other is Iterable<T>) {
      return Set.of(this)..removeAll(other);
    }

    throw 'cannot remove ${other.runtimeType} from a set of $T';
  }
}
