part of g3.stimpack.rbac.generated;



class StimRbacAction extends StimModelSymbol<StimRbacAction> {
  StimRbacActionRef _ref;

  StimRbacActionRef get ref {
    return _ref ??= StimRbacActionRef();
  }
  StimRbacAction();
}


class StimRbacActionRef extends StimSymbolRef<StimRbacAction> implements StimRbacAction {

}


class StimRbacActionScope {
  /// Creates a new "action" of [StimRbacAction] type.
  StimRbacAction of({dynamic name, Set<StimModelTag> tags}) {
    return StimRbacAction()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
