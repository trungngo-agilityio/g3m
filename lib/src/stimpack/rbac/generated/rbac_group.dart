part of g3.stimpack.rbac.generated;



class StimRbacGroup extends StimModelSymbol<StimRbacGroup> {
  Set<StimRbacGroup> groups;

  Set<StimRbacRole> roles;

  StimRbacGroupRef _ref;

  StimRbacGroupRef get ref {
    return _ref ??= StimRbacGroupRef();
  }
  StimRbacGroup();
}


class StimRbacGroupRef extends StimSymbolRef<StimRbacGroup> implements StimRbacGroup {

}


class StimRbacGroupScope {
  /// Creates a new "group" of [StimRbacGroup] type.
  StimRbacGroup of({dynamic name, Set<StimRbacGroup> groups, Set<StimRbacRole> roles, Set<StimModelTag> tags}) {
    return StimRbacGroup()
        ..name = StimName.of(name)
        ..groups = groups ?? {}
        ..roles = roles ?? {}
        ..tags = tags ?? {};
  }
}
