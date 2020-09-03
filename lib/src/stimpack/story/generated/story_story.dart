part of g3.stimpack.story.generated;



class StimStoryStory extends StimModelSymbol<StimStoryStory> {
  StimStoryActor actor;

  StimStoryAction action;

  StimStoryStoryRef _ref;

  StimStoryStoryRef get ref {
    return _ref ??= StimStoryStoryRef();
  }
  StimStoryStory();
}


class StimStoryStoryRef extends StimSymbolRef<StimStoryStory> implements StimStoryStory {

}


class StimStoryStoryScope {
  /// Creates a new "story" of [StimStoryStory] type.
  StimStoryStory of({dynamic name, @required
  StimStoryActor actor, @required
  StimStoryAction action, Set<StimModelTag> tags}) {
    return StimStoryStory()
        ..name = StimName.of(name)
        ..actor = actor
        ..action = action
        ..tags = tags ?? {};
  }
}
