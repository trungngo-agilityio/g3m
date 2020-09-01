part of g3.stimpack2.rbac;

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
  StimRbacPolicyKind();
}
