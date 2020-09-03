part of g3.stimpack.rbac;

class StimRbacGroupScope {
  StimRbacGroup of({
    @required dynamic name,
    Set<StimModelTag> tags,
  }) =>
      StimRbacGroup()
        ..name = StimName.of(name)
        ..tags = tags;
}

class StimRbacGroup extends StimModelSymbol<StimRbacGroup> {
  Set<StimRbacGroup> groups;
  Set<StimRbacRole> roles;

  StimRbacGroupRef _ref;

  /// Gets the reference to this model.
  StimRbacGroup get ref => _ref ??= StimRbacGroupRef()..symbol = this;

  StimRbacGroup();
}

class StimRbacGroupRef extends StimSymbolRef<StimRbacGroup>
    implements StimRbacGroup {}
