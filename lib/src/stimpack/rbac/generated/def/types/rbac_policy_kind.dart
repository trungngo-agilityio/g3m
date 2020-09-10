part of g3.stimpack.rbac.generated;



class StimRbacPolicyKind extends StimModelSymbol<StimRbacPolicyKind> {
  StimRbacPolicyKind();


  StimRbacPolicyKind ref() {
    return StimRbacPolicyKindRef()..symbol = this;
  }

  /// Creates a new "policyKind" of [StimRbacPolicyKind] type.
  StimRbacPolicyKind refWith({dynamic name, Set<StimModelTag> tags}) {
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


class StimRbacPolicyKindRef extends StimSymbolRef<StimRbacPolicyKind> implements StimRbacPolicyKind {

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
