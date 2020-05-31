part of g3m.ex;

class ActorScopeEx extends ActorScope {
  Actor user;

  Actor guest;

  Actor admin;

  ActorScopeEx() {
    user = call('user');
    guest = call('guest');
    admin = call('admin');
  }
}
