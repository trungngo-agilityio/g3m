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
  StimRbacActionRef _ref;

  /// Gets the reference to this model.
  StimRbacAction get ref => _ref ??= StimRbacActionRef()..symbol = this;

  StimRbacAction();
}

class StimRbacActionRef extends StimSymbolRef<StimRbacAction>
    implements StimRbacAction {}
