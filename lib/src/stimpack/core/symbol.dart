part of g3.stimpack.core;

class StimSymbol<T> {}

/// Deep clone a symbol to make a new one.
T _cloneSymbol<T>(T s, bool deep, [Set processing, Map processed]) {
  if (s == null) {
    return null;
  } else if (s is StimSymbolRef) {
    return s;
  }

  if (deep == true) {
    // Need to track the symbol to avoid stack overflow
    if (processing == null) {
      processing = {s};
    } else if (processing.contains(s)) {
      throw 'cannot clone recursive data structure '
          'where a parent is referenced in a child';
    } else if (processed?.containsKey(s) == true) {
      // this element has been cloned before, return it
      return processed[s];
    }

    //  Starts normal processing.
    processing.add(s);
  }

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

      if (deep == true) {
        if (f is StimSymbolRef) {
          // Don't do anything. Returns the exact reference.
        } else if (f is StimSymbol) {
          v = _cloneSymbol(f, true, processing, processed);
        } else if (f is List) {
          // FIXME: Need to clone child
//          v = f.map((e) => _cloneSymbol(e, deep)).toList();
          v = f.toList();
        } else if (f is Set) {
          // FIXME: Need to clone child
          v = f.toSet();
//          v = f.map((e) => _cloneSymbol(e, deep)).toSet();
        }
      }

      tm.setField(i.simpleName, v);
    }
  }

  // Returns the cloned object.
  final res = tm.reflectee as T;
  if (deep == true) {
    processed ??= {};
    processed[s] = res;
  }
  return res;
}

extension StimSymbolExtension<T extends StimSymbol<T>> on StimSymbol<T> {
  T clone() => _cloneSymbol(this, false);

//  T deepClone() => _cloneSymbol(this, true);

  Set<T> operator +(dynamic other) {
    if (this == null) {
      if (other == null) return null;
      if (other is T) return Set<T>.of({other});
      if (other is Iterable<T>) return Set<T>.of(other);
    }

    if (other is T) return Set<T>.of({this, other});
    if (other is Iterable<T>) return Set<T>.of({this})..addAll(other);
    throw 'cannot add ${other.runtimeType} to a $T';
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
