import 'dart:mirrors';

class Name {
  final String value;

  Name(this.value);
}

class Term<T extends Term<T>> {}

class Story extends Term<Story> {
  Name name;
  Action action;
  List<Action> actions;

  Story();

  Story.of({Action action, Set<Action> actions}) : super();

  @override
  String toString() {
    return 'Story{name: ${name.value}, action: ${action?.name}';
  }
}

class Action extends Term<Action> {
  String name;

  Action();

  @override
  String toString() {
    return 'Action{name: $name}';
  }
}

T _cloneTerm<T>(T term) {
  final im = reflect(term);
  final tm = im.type.newInstance(Symbol.empty, []);
  for (final i in im.type.instanceMembers.values) {
    if (i.isGetter && i.isSynthetic) {
      final fm = im.getField(i.simpleName);

      final f = fm.reflectee;
      dynamic v = f;
      if (f is Term) {
        // this is a term
        v = _cloneTerm(f);
      } else if (f is List) {
        v = f.toList();
      } else if (f is Set) {
        v = f.toSet();
      }
      tm.setField(i.simpleName, v);
    }
  }
  return tm.reflectee as T;
}

extension CloneSet<T extends Term<T>> on Set<T> {
  Set<T> clone() {
    return Set<T>.of(this);
  }
}

extension Clone<T extends Term<T>> on Term<T> {
  T clone() => _cloneTerm(this);
}

void main() {
  final cm = reflectClass(Story);

  final a = Story.of();
  var action1 = Action()..name = 'action1';
  final story1 = Story()
    ..name = Name('hello')
    ..actions = [action1]
    ..action = action1;
  final story2 = story1.clone();
  story2.action.name = 'action2';

  print(story1);
  print(story2);
  assert(story1.action != story2.action);
  assert(story1.actions != story2.actions);
  story1.actions.add(Action()..name = 'action3');
  print(story1.actions);
  print(story2.actions);
}
