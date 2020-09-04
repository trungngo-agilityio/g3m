part of g3.stimpack.story.generated;



class StimStoryEpic extends StimModelSymbol<StimStoryEpic> {
  Set<StimStoryStory> stories;

  StimStoryEpic();


  StimStoryEpic ref() {
    return StimStoryEpicRef()..symbol = this;
  }

  /// Creates a new "epic" of [StimStoryEpic] type.
  StimStoryEpic refWith({dynamic name, Set<StimStoryStory> stories, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (stories != null) {
      res.stories = stories;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}


class StimStoryEpicRef extends StimSymbolRef<StimStoryEpic> implements StimStoryEpic {

}


class StimStoryEpicScope {
  /// Creates a new "epic" of [StimStoryEpic] type.
  StimStoryEpic of({dynamic name, @required
  Set<StimStoryStory> stories, Set<StimModelTag> tags}) {
    return StimStoryEpic()
        ..name = StimName.of(name)
        ..stories = stories ?? {}
        ..tags = tags ?? {};
  }
}
