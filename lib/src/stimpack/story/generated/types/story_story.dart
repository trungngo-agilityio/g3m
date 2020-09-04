part of g3.stimpack.story.generated;

class StimStoryStory extends StimModelSymbol<StimStoryStory> {
  StimStoryActor actor;

  StimStoryAction action;

  StimStoryStory();

  StimStoryStory ref() {
    return StimStoryStoryRef()..symbol = this;
  }

  /// Creates a new "story" of [StimStoryStory] type.
  StimStoryStory refWith(
      {dynamic name,
      StimStoryActor actor,
      StimStoryAction action,
      Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (actor != null) {
      res.actor = actor;
    }
    if (action != null) {
      res.action = action;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}

class StimStoryStoryRef extends StimSymbolRef<StimStoryStory>
    implements StimStoryStory {}

class StimStoryStoryScope {
  /// Creates a new "story" of [StimStoryStory] type.
  StimStoryStory of(
      {dynamic name,
      @required StimStoryActor actor,
      @required StimStoryAction action,
      Set<StimModelTag> tags}) {
    return StimStoryStory()
      ..name = StimName.of(name)
      ..actor = actor
      ..action = action
      ..tags = tags ?? {};
  }
}
