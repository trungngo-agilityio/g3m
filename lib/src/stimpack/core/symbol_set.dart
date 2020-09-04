part of g3.stimpack.core;

extension StimSetExtension<T> on Set<T> {
  Set<T> clone() {
    return Set<T>.of(this);
  }

  // // FIXME, this does not work yet
  // Set<T> deepClone() {
  //   if (isNotEmpty != true) return this;
  //   return Set<T>.of(map((e) => _cloneSymbol<T>(e, true)).toSet());
  // }

  /// Adds a set with another.
  /// If a set is null, the make sure the other is a T or set of T then return.
  /// Otherwise, make sure the other is T or set of T and then
  /// make a new set and return.
  ///
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
