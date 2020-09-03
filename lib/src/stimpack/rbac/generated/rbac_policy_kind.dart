part of g3.stimpack.rbac.generated;



class StimRbacPolicyKind extends StimModelSymbol<StimRbacPolicyKind> {
  StimRbacPolicyKindRef _ref;

  StimRbacPolicyKindRef get ref {
    return _ref ??= StimRbacPolicyKindRef();
  }
  StimRbacPolicyKind();
}


class StimRbacPolicyKindRef extends StimSymbolRef<StimRbacPolicyKind> implements StimRbacPolicyKind {

}


class StimRbacPolicyKindScope {
  StimRbacPolicyKind allow;

  StimRbacPolicyKind deny;


  /// Creates a new "policyKind" of [StimRbacPolicyKind] type.
  StimRbacPolicyKind of({dynamic name, Set<StimModelTag> tags}) {
    return StimRbacPolicyKind()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
