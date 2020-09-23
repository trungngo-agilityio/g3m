part of g3.stimpack.story.generated;



class StimStoryActor extends StimModelSymbol<StimStoryActor> {
  Set<StimRbacRole> roles;

  StimStoryActor();


  /// Creates a new "actor" of [StimStoryActor] type.
  StimStoryActor copyWith({@required
  dynamic name, Set<StimRbacRole> roles, Set<StimModelTag> tags}) {
    return StimStoryActor()
        ..name = StimName.of(name ?? this.name)
        ..roles = roles ?? this.roles
        ..tags = tags ?? this.tags;
  }
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
