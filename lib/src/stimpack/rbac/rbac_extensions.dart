part of g3.stimpack.rbac;

extension StimRbacExtensions on StimRbacPolicyScope {
  StimRbacPolicy deny({
    dynamic name,
    @required Set<StimRbacResource> resources,
    @required Set<StimRbacAction> actions,
    Set<StimModelTag> tags,
  }) {
    return of(
      name: name,
      kind: stimpack.rbac.policyKind.deny,
      resources: resources,
      actions: actions,
      tags: tags,
    );
  }

  StimRbacPolicy allow({
    dynamic name,
    @required Set<StimRbacResource> resources,
    @required Set<StimRbacAction> actions,
    Set<StimModelTag> tags,
  }) {
    return of(
      name: name,
      kind: stimpack.rbac.policyKind.allow,
      resources: resources,
      actions: actions,
      tags: tags,
    );
  }
}
