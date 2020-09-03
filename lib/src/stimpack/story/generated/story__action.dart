part of g3.stimpack.story.generated;



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
  StimStoryAction create;

  StimStoryAction update;

  StimStoryAction get;

  StimStoryAction find;

  StimStoryAction delete;

  StimStoryAction undelete;

  StimStoryAction manage;

  StimStoryAction signUp;

  StimStoryAction signIn;

  StimStoryAction signOut;

  StimStoryAction star;

  StimStoryAction unStar;

  StimStoryAction like;

  StimStoryAction unlike;

  StimStoryAction send;

  StimStoryAction receive;

  StimStoryAction submit;

  StimStoryAction cancel;

  StimStoryAction share;

  StimStoryAction unshare;

  StimStoryAction start;

  StimStoryAction stop;

  StimStoryAction pause;

  StimStoryAction resume;

  StimStoryAction enter;

  StimStoryAction leave;

  StimStoryAction upload;

  StimStoryAction download;

  StimStoryAction invite;

  StimStoryAction suggest;

  StimStoryAction accept;

  StimStoryAction deny;

  StimStoryAction request;

  StimStoryAction reset;

  StimStoryAction see;


  /// Creates a new "stimStoryAction" of [StimStoryAction] type.
  StimStoryAction of({dynamic name, Set<StimModelTag> tags}) {
    return StimStoryAction()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
