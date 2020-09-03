part of g3.stimpack.rbac.generated;



class StimRbacPolicy extends StimModelSymbol<StimRbacPolicy> {
  StimRbacPolicyKind kind;

  Set<StimRbacResource> resources;

  Set<StimRbacAction> actions;

  StimRbacPolicyRef _ref;

  StimRbacPolicyRef get ref {
    return _ref ??= StimRbacPolicyRef();
  }
  StimRbacPolicy();
}


class StimRbacPolicyRef extends StimSymbolRef<StimRbacPolicy> implements StimRbacPolicy {

}


class StimRbacPolicyScope {
  /// Creates a new "policy" of [StimRbacPolicy] type.
  StimRbacPolicy of({dynamic name, @required
  StimRbacPolicyKind kind, @required
  Set<StimRbacResource> resources, @required
  Set<StimRbacAction> actions, Set<StimModelTag> tags}) {
    return StimRbacPolicy()
        ..name = StimName.of(name)
        ..kind = kind
        ..resources = resources ?? {}
        ..actions = actions ?? {}
        ..tags = tags ?? {};
  }
}
