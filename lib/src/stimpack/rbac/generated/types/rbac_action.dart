part of g3.stimpack.rbac.generated;

class StimRbacAction extends StimModelSymbol<StimRbacAction> {
  StimRbacAction();

  StimRbacAction ref() {
    return StimRbacActionRef()..symbol = this;
  }

  /// Creates a new "action" of [StimRbacAction] type.
  StimRbacAction refWith({dynamic name, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}

class StimRbacActionRef extends StimSymbolRef<StimRbacAction>
    implements StimRbacAction {}

class StimRbacActionScope {
  /// Creates a new "action" of [StimRbacAction] type.
  StimRbacAction of({dynamic name, Set<StimModelTag> tags}) {
    return StimRbacAction()
      ..name = StimName.of(name)
      ..tags = tags ?? {};
  }
}
