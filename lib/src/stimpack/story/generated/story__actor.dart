part of g3.stimpack.story.generated;



class StimStoryActor extends StimModelSymbol<StimStoryActor> {
  Set<StimModelTag> tags;

  StimStoryActorRef _ref;

  StimStoryActorRef get ref {
    return _ref ??= StimStoryActorRef();
  }
  StimStoryActor();
}


class StimStoryActorRef extends StimSymbolRef<StimStoryActor> implements StimStoryActor {

}


class StimStoryActorScope {
  /// Creates a new "stimStoryActor" of [StimStoryActor] type.
  StimStoryActor of({dynamic name, Set<StimModelTag> tags}) {
    return StimStoryActor()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
