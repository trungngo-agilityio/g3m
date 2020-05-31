part of g3m.core;

class Actor extends Expr<Actor> {
  bool _authorized;

  bool get authorized => _authorized;

  set authorized(bool value) {
    assert(value != null, 'value argument cannot be null');
    eval().forEach((e) => e._authorized = value);
  }

  Actor(ActorScope scope) : super(scope);
}

class ActorScope extends Scope<Actor> {
  @override
  Actor make() => Actor(this);

  Actor call(String name, {bool authorized}) {
    return add(name).._authorized = authorized ?? false;
  }
}
