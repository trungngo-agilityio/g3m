import 'dart:mirrors';

class Term<T extends Term<T>> {}

class Story implements Term<Story> {
  final String name;
  Action action;
  Set<Actor> actor;


  Story(this.name, {this.action, this.actor});

  @override
  String toString() {
    return name;
  }
}

class Actor implements Term<Actor> {
  final String name;

  Actor(this.name);

  @override
  String toString() {
    return name;
  }
}

class Action implements Term<Action> {
  final String name;

  Action(this.name);

  @override
  String toString() {
    return name;
  }
}

extension SetExtension<T> on Set<T> {
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

extension IterableExtension<T> on Iterable<T> {
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

extension SymbolExtension<T extends Term<T>> on Term<T> {
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

void main() {
  final a = Story('s1'), b = Story('s2'), c = Story('s3');
  final d = a + b;
  print(d);
  final e = c + d;
  print(e);

  d.fieldSet(#action, Action('action1'));
  print(a.action);
  print(b.action);
  a.actor += Actor('actor a');
  b.actor += Actor('actor b');
  d
    ..fieldAdd(#actor, {Actor('action1')});
}
