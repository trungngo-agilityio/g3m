part of g3m.ex;

class StoryActorScopeEx extends ActorScope {
  Actor user;

  Actor guest;

  Actor admin;

  StoryActorScopeEx() {
    user = call('user');
    guest = call('guest');
    admin = call('admin');
  }
}
