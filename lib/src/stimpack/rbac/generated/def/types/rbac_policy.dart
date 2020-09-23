part of g3.stimpack.rbac.generated;



class StimRbacPolicy extends StimModelSymbol<StimRbacPolicy> {
  StimRbacPolicyKind kind;

  Set<StimRbacResource> resources;

  Set<StimRbacAction> actions;

  Set<StimRbacCondition> conditions;

  StimRbacPolicy();


  /// Creates a new "policy" of [StimRbacPolicy] type.
  StimRbacPolicy copyWith({@required
  dynamic name, @required
  StimRbacPolicyKind kind, @required
  Set<StimRbacResource> resources, @required
  Set<StimRbacAction> actions, @required
  Set<StimRbacCondition> conditions, Set<StimModelTag> tags}) {
    return StimRbacPolicy()
        ..name = StimName.of(name ?? this.name)
        ..kind = kind ?? this.kind
        ..resources = resources ?? this.resources
        ..actions = actions ?? this.actions
        ..conditions = conditions ?? this.conditions
        ..tags = tags ?? this.tags;
  }
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
