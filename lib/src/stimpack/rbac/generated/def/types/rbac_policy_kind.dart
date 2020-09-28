part of g3.stimpack.rbac.generated;



class StimRbacPolicyKind extends StimModelSymbol<StimRbacPolicyKind> {
  StimRbacPolicyKind();


  /// Creates a new "policyKind" of [StimRbacPolicyKind] type.
  StimRbacPolicyKind copyWith({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimRbacPolicyKind()
        ..name = StimName.of(name ?? this.name)
        ..tags = tags ?? this.tags;
  }
}


class StimRbacPolicyKindScope {
  StimRbacPolicyKind allow;

  StimRbacPolicyKind deny;


  /// Creates a new "policyKind" of [StimRbacPolicyKind] type.
  StimRbacPolicyKind of({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimRbacPolicyKind()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
