part of g3.stimpack.rbac.init;

extension StimRbacPolicyExtensions on StimRbacPolicyScope {
  StimRbacPolicy deny({
    dynamic name,
    @required Set<StimRbacResource> resources,
    @required Set<StimRbacAction> actions,
    Set<StimRbacCondition> conditions,
    Set<StimModelTag> tags,
  }) {
    return of(
      name: name,
      kind: stimpack.rbac.policyKind.deny,
      resources: resources,
      actions: actions,
      conditions: conditions,
      tags: tags,
    );
  }

  StimRbacPolicy allow({
    dynamic name,
    @required Set<StimRbacResource> resources,
    @required Set<StimRbacAction> actions,
    @required Set<StimRbacCondition> conditions,
    Set<StimModelTag> tags,
  }) {
    return of(
      name: name,
      kind: stimpack.rbac.policyKind.allow,
      resources: resources,
      actions: actions,
      conditions: conditions,
      tags: tags,
    );
  }
}

extension StimRbacResourceExtensions on StimRbacResourceScope {
  /// Creates a managed resource at root.
  /// The [StimRbacResource.parent] is [stimpack.rbac.resource.root].
  /// The [id] field should be the name of the resource type, e.g.,
  /// firestore, mongodb, etc.
  ///
  StimRbacResource rootResourceOf({
    @required @required dynamic name,
    @required StimRbacResourceKind kind,
    Set<StimModelTag> tags,
  }) {
    return of(
      name: name,
      kind: kind,
      parent: stimpack.rbac.resource.root,
      tags: tags,
    );
  }
}
