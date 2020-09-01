part of g3.stimpack2.rbac;

class StimRbacActionScope {
  StimRbacAction read, write, list;

  StimRbacAction of({
    @required dynamic name,
    Set<StimModelTag> tags,
  }) =>
      StimRbacAction()
        ..name = StimName.of(name)
        ..tags = tags;
}

class StimRbacAction extends StimModelSymbol<StimRbacAction> {
  StimRbacAction();
}
