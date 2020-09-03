part of g3.stimpack2.story.generated;



class StimStoryAction extends StimModelSymbol<StimStoryAction> {
  Set<StimModelTag> tags;

  StimStoryActionRef _ref;

  StimStoryActionRef get ref {
    return _ref ??= StimStoryActionRef();
  }
  StimStoryAction();
}


class StimStoryActionRef extends StimSymbolRef<StimStoryAction> implements StimStoryAction {

}


class StimStoryActionScope {
  /// Creates a new "action" of [StimStoryAction] type.
  StimStoryAction of({dynamic name, Set<StimModelTag> tags}) {
    return StimStoryAction()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
