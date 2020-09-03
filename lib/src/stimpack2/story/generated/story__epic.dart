part of g3.stimpack2.story.generated;



class StimStoryEpic extends StimModelSymbol<StimStoryEpic> {
  StimStoryActor actor;

  StimStoryAction action;

  Set<StimModelTag> tags;

  StimStoryEpicRef _ref;

  StimStoryEpicRef get ref {
    return _ref ??= StimStoryEpicRef();
  }
  StimStoryEpic();
}


class StimStoryEpicRef extends StimSymbolRef<StimStoryEpic> implements StimStoryEpic {

}


class StimStoryEpicScope {
  /// Creates a new "epic" of [StimStoryEpic] type.
  StimStoryEpic of({dynamic name, @required StimStoryActor actor, @required StimStoryAction action, Set<StimModelTag> tags}) {
    return StimStoryEpic()
        ..name = StimName.of(name)
        ..actor = actor
        ..action = action
        ..tags = tags ?? {};
  }
}
