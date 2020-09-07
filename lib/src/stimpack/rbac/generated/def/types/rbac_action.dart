part of g3.stimpack.rbac.generated;



class StimRbacAction extends StimModelSymbol<StimRbacAction> {
  Set<StimRbacAction> actions;

  StimRbacAction();


  StimRbacAction ref() {
    return StimRbacActionRef()..symbol = this;
  }

  /// Creates a new "action" of [StimRbacAction] type.
  StimRbacAction refWith({dynamic name, Set<StimRbacAction> actions, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (actions != null) {
      res.actions = actions;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimRbacActionRef extends StimSymbolRef<StimRbacAction> implements StimRbacAction {

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

  StimRbacAction access;


  /// Creates a new "action" of [StimRbacAction] type.
  StimRbacAction of({dynamic name, Set<StimRbacAction> actions, Set<StimModelTag> tags}) {
    return StimRbacAction()
        ..name = StimName.of(name)
        ..actions = actions ?? {}
        ..tags = tags ?? {};
  }
}
