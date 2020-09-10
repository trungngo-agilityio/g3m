part of g3.stimpack.story.generated;



class StimStoryActor extends StimModelSymbol<StimStoryActor> {
  Set<StimRbacRole> roles;

  StimStoryActor();


  StimStoryActor ref() {
    return StimStoryActorRef()..symbol = this;
  }

  /// Creates a new "actor" of [StimStoryActor] type.
  StimStoryActor refWith({dynamic name, Set<StimRbacRole> roles, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (roles != null) {
      res.roles = roles;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimStoryActorRef extends StimSymbolRef<StimStoryActor> implements StimStoryActor {

}


class StimStoryActorScope {
  /// Creates a new "actor" of [StimStoryActor] type.
  StimStoryActor of({@required
  dynamic name, Set<StimRbacRole> roles, Set<StimModelTag> tags}) {
    return StimStoryActor()
        ..name = StimName.of(name)
        ..roles = roles ?? {}
        ..tags = tags ?? {};
  }
}
