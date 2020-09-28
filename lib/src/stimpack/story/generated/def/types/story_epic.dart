part of g3.stimpack.story.generated;



class StimStoryEpic extends StimModelSymbol<StimStoryEpic> {
  Set<StimStoryStory> stories;

  StimStoryEpic();


  /// Creates a new "epic" of [StimStoryEpic] type.
  StimStoryEpic copyWith({@required
  dynamic name, @required
  Set<StimStoryStory> stories, Set<StimModelTag> tags}) {
    return StimStoryEpic()
        ..name = StimName.of(name ?? this.name)
        ..stories = stories ?? this.stories
        ..tags = tags ?? this.tags;
  }
}


class StimStoryEpicScope {
  /// Creates a new "epic" of [StimStoryEpic] type.
  StimStoryEpic of({@required
  dynamic name, @required
  Set<StimStoryStory> stories, Set<StimModelTag> tags}) {
    return StimStoryEpic()
        ..name = StimName.of(name)
        ..stories = stories ?? {}
        ..tags = tags ?? {};
  }
}
