part of g3.stimpack.story.generated;



class StimStoryActor extends StimModelSymbol<StimStoryActor> {
  Set<StimRbacRole> roles;

  StimStoryActorRef _ref;

  StimStoryActorRef get ref {
    return _ref ??= StimStoryActorRef();
  }
  StimStoryActor();
}


class StimStoryActorRef extends StimSymbolRef<StimStoryActor> implements StimStoryActor {

}


class StimStoryActorScope {
  /// Creates a new "actor" of [StimStoryActor] type.
  StimStoryActor of({dynamic name, Set<StimRbacRole> roles, Set<StimModelTag> tags}) {
    return StimStoryActor()
        ..name = StimName.of(name)
        ..roles = roles ?? {}
        ..tags = tags ?? {};
  }
}
