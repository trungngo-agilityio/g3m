part of g3.stimpack2.core;

class StimSymbol<T> {}

/// Deep clone a symbol to make a new one.
T _cloneSymbol<T>(T s) {
  final im = reflect(s);

  InstanceMirror tm;

  try {
    tm = im.type.newInstance(Symbol.empty, []);
  } catch (e) {
    printError('$T class much have a default constructor.');
    exit(1);
  }

  // Loops through all members of the class and try to clone all fields.
  final members = im.type.instanceMembers.values;
  for (final i in members) {
    if (i.isGetter && i.isSynthetic && !i.isStatic && !i.isPrivate) {
      // Gets out the field mirror and its value.
      final fm = im.getField(i.simpleName);
      final f = fm.reflectee;

      // Try to clone the value for deep clone. Worst case, just use the
      // old value for shallow clone.
      dynamic v = f;

      if (f is StimSymbol) {
        v = _cloneSymbol(f);
      } else if (f is List) {
        v = f.toList();
      } else if (f is Set) {
        v = f.toSet();
      }

      tm.setField(i.simpleName, v);
    }
  }

  // Returns the cloned object.
  return tm.reflectee as T;
}

extension CloneSet<T extends StimSymbol<T>> on Set<T> {
  Set<T> clone() {
    return Set<T>.of(this);
  }
}

extension StimSymbolExtension<T extends StimSymbol<T>> on StimSymbol<T> {
  T clone() => _cloneSymbol(this);

  Set<T> operator +(dynamic other) {
    if (other is T) {
      return Set<T>.of({this, other});
    } else if (other is Iterable<T>) {
      return Set<T>.of({this})..addAll(other);
    } else {
      throw 'cannot add ${other.runtimeType} to a $T';
    }
  }
}

extension StimSetExtension<T> on Set<T> {
  Set<T> operator +(dynamic other) {
    if (this == null) {
      if (other == null) return null;
      if (other is T) return {other};
      return other;
    }

    if (other == null) return Set.of(this);
    if (other is T) {
      return Set.of(this)..add(other);
    } else if (other is Iterable<T>) {
      return Set.of(this)..addAll(other);
    } else {
      throw 'cannot add ${other.runtimeType} to a set of $T';
    }
  }
}

extension StimIterableExtension<T> on Iterable<T> {
  void fieldAdd(Symbol field, dynamic value) {
    for (final i in this) {
      final f = reflect(i);
      final t = reflectClass(T);

      final mf = f.getField(field);
      final mff = reflect(mf.reflectee).type.instanceMembers;

      f.setField(field, value);
    }
  }

  void fieldSet(Symbol field, dynamic value) {
    for (final i in this) {
      final f = reflect(i);
      f.setField(field, value);
    }
  }
}
