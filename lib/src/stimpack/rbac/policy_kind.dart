part of g3.stimpack.rbac;

class StimRbacPolicyKindScope {
  StimRbacPolicyKind allow, deny;

  StimRbacPolicyKind of({
    @required dynamic name,
    Set<StimModelTag> tags,
  }) =>
      StimRbacPolicyKind()
        ..name = StimName.of(name)
        ..tags = tags;
}

class StimRbacPolicyKind extends StimModelSymbol<StimRbacPolicyKind> {
  StimRbacPolicyKindRef _ref;

  /// Gets the reference to this model.
  StimRbacPolicyKind get ref => _ref ??= StimRbacPolicyKindRef()..symbol = this;

  StimRbacPolicyKind();
}

class StimRbacPolicyKindRef extends StimSymbolRef<StimRbacPolicyKind>
    implements StimRbacPolicyKind {}
