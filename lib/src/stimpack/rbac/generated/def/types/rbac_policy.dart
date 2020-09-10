part of g3.stimpack.rbac.generated;



class StimRbacPolicy extends StimModelSymbol<StimRbacPolicy> {
  StimRbacPolicyKind kind;

  Set<StimRbacResource> resources;

  Set<StimRbacAction> actions;

  Set<StimRbacCondition> conditions;

  StimRbacPolicy();


  StimRbacPolicy ref() {
    return StimRbacPolicyRef()..symbol = this;
  }

  /// Creates a new "policy" of [StimRbacPolicy] type.
  StimRbacPolicy refWith({dynamic name, StimRbacPolicyKind kind, Set<StimRbacResource> resources, Set<StimRbacAction> actions, Set<StimRbacCondition> conditions, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (kind != null) {
      res.kind = kind;
    }

    if (resources != null) {
      res.resources = resources;
    }

    if (actions != null) {
      res.actions = actions;
    }

    if (conditions != null) {
      res.conditions = conditions;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimRbacPolicyRef extends StimSymbolRef<StimRbacPolicy> implements StimRbacPolicy {

}


class StimRbacPolicyScope {
  /// Creates a new "policy" of [StimRbacPolicy] type.
  StimRbacPolicy of({@required
  dynamic name, @required
  StimRbacPolicyKind kind, @required
  Set<StimRbacResource> resources, @required
  Set<StimRbacAction> actions, @required
  Set<StimRbacCondition> conditions, Set<StimModelTag> tags}) {
    return StimRbacPolicy()
        ..name = StimName.of(name)
        ..kind = kind
        ..resources = resources ?? {}
        ..actions = actions ?? {}
        ..conditions = conditions ?? {}
        ..tags = tags ?? {};
  }
}
