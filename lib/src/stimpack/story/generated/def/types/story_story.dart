part of g3.stimpack.story.generated;



class StimStoryStory extends StimModelSymbol<StimStoryStory> {
  StimStoryActor actor;

  StimStoryAction action;

  StimStoryStory();


  /// Creates a new "story" of [StimStoryStory] type.
  StimStoryStory copyWith({@required
  dynamic name, @required
  StimStoryActor actor, @required
  StimStoryAction action, Set<StimModelTag> tags}) {
    return StimStoryStory()
        ..name = StimName.of(name ?? this.name)
        ..actor = actor ?? this.actor
        ..action = action ?? this.action
        ..tags = tags ?? this.tags;
  }
}


class StimStoryStoryScope {
  /// Creates a new "story" of [StimStoryStory] type.
  StimStoryStory of({@required
  dynamic name, @required
  StimStoryActor actor, @required
  StimStoryAction action, Set<StimModelTag> tags}) {
    return StimStoryStory()
        ..name = StimName.of(name)
        ..actor = actor
        ..action = action
        ..tags = tags ?? {};
  }
}
