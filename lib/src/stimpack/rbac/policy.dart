part of g3.stimpack.rbac;

class StimRbacPolicyScope {
  StimRbacPolicy of({
    @required dynamic name,
    Set<StimModelTag> tags,
    @required StimRbacResource resource,
    @required Set<StimRbacAction> actions,
  }) =>
      StimRbacPolicy()
        ..name = StimName.of(name)
        ..resource = resource
        ..actions = actions
        ..tags = tags;
}

class StimRbacPolicy extends StimModelSymbol<StimRbacPolicy> {
  /// The kind of policy. E.g., allow, or deny resource actions.
  StimRbacPolicyKind kind;

  /// The resource applicable to the policy
  StimRbacResource resource;

  /// The actions that can be performed on the resource
  Set<StimRbacAction> actions;

  StimRbacPolicyRef _ref;

  /// Gets the reference to this model.
  StimRbacPolicy get ref => _ref ??= StimRbacPolicyRef()..symbol = this;

  StimRbacPolicy();
}

class StimRbacPolicyRef extends StimSymbolRef<StimRbacPolicy>
    implements StimRbacPolicy {}