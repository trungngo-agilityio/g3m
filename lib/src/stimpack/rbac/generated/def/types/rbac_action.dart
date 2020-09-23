part of g3.stimpack.rbac.generated;



class StimRbacAction extends StimModelSymbol<StimRbacAction> {
  Set<StimRbacAction> actions;

  StimRbacAction();


  /// Creates a new "action" of [StimRbacAction] type.
  StimRbacAction copyWith({@required
  dynamic name, Set<StimRbacAction> actions, Set<StimModelTag> tags}) {
    return StimRbacAction()
        ..name = StimName.of(name ?? this.name)
        ..actions = actions ?? this.actions
        ..tags = tags ?? this.tags;
  }
}


class StimRbacActionScope {
  StimRbacAction createOne;

  StimRbacAction findOne;

  StimRbacAction updateOne;

  StimRbacAction deleteOne;

  StimRbacAction delete;

  StimRbacAction find;

  StimRbacAction read;

  StimRbacAction write;

  StimRbacAction readWrite;

  StimRbacAction readWriteDelete;


  /// Creates a new "action" of [StimRbacAction] type.
  StimRbacAction of({@required
  dynamic name, Set<StimRbacAction> actions, Set<StimModelTag> tags}) {
    return StimRbacAction()
        ..name = StimName.of(name)
        ..actions = actions ?? {}
        ..tags = tags ?? {};
  }
}
