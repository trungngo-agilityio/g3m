part of g3m.core;

class Action extends Expr<Action> {
  Action(ActionScope scope) : super(scope);
}

class ActionScope extends Scope<Action> {
  @override
  Action make() => Action(this);

  Action call(String name) {
    return add(name);
  }
}
