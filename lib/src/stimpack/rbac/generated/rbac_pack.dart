part of g3.stimpack.rbac.generated;

/// The only instance of the [StimRbac] pack.
StimRbac _rbac;

class StimRbac extends StimPack {
  StimModelPackage _metaPackage;

  /// Scope class for constructing all "action" symbols,
  /// typed of [StimRbacAction]."
  final StimRbacActionScope action;

  /// Scope class for constructing all "resource" symbols,
  /// typed of [StimRbacResource]."
  final StimRbacResourceScope resource;

  /// Scope class for constructing all "group" symbols,
  /// typed of [StimRbacGroup]."
  final StimRbacGroupScope group;

  /// Scope class for constructing all "role" symbols,
  /// typed of [StimRbacRole]."
  final StimRbacRoleScope role;

  /// Scope class for constructing all "policy" symbols,
  /// typed of [StimRbacPolicy]."
  final StimRbacPolicyScope policy;

  /// Scope class for constructing all "policyKind" symbols,
  /// typed of [StimRbacPolicyKind]."
  final StimRbacPolicyKindScope policyKind;

  final StimRbacOnStimModelType onStimModelType;

  StimRbac(StimModel model)
      : action = StimRbacActionScope(),
        resource = StimRbacResourceScope(),
        group = StimRbacGroupScope(),
        role = StimRbacRoleScope(),
        policy = StimRbacPolicyScope(),
        policyKind = StimRbacPolicyKindScope(),
        onStimModelType = StimRbacOnStimModelType(),
        super('rbac') {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();

    /// Call custom pack initialization code, this code is
    /// not overwritten during pack re-generation.
    stimInitRbacPack(this);
  }

  void _buildMeta() {
    final m = stimpack.model, f = m.field, t = m.type;
    final mp = _metaPackage = m.package.of(name: 'rbac');
    final mt = onStimModelType;

    /// Builds type "action"
    mt.action = t.symbolOf(name: 'action', package: mp);

    /// Builds type "resource"
    mt.resource = t.symbolOf(name: 'resource', package: mp);

    /// Builds type "group"
    mt.group = t.symbolOf(name: 'group', package: mp);

    /// Builds type "role"
    mt.role = t.symbolOf(name: 'role', package: mp);

    /// Builds type "policy"
    mt.policy = t.symbolOf(name: 'policy', package: mp);

    /// Builds type "policyKind"
    mt.policyKind = t.symbolOf(name: 'policyKind', package: mp);

    /// Builds fields for type "resource"
    mt.resource.fields = {
      /// field "resource"
      f.of(name: 'parent', type: mt.resource)
    };

    /// Builds fields for type "group"
    mt.group.fields = {
      /// field "group"
      f.of(name: 'groups', type: t.setOf(item: mt.group)),

      /// field "group"
      f.of(name: 'roles', type: t.setOf(item: mt.role))
    };

    /// Builds fields for type "role"
    mt.role.fields = {
      /// field "role"
      f.of(name: 'roles', type: t.setOf(item: mt.role))
    };

    /// Builds fields for type "policy"
    mt.policy.fields = {
      /// field "policy"
      f.of(name: 'kind', type: mt.policyKind).required(),

      /// field "policy"
      f.of(name: 'resources', type: t.setOf(item: mt.resource)).required(),

      /// field "policy"
      f.of(name: 'actions', type: t.setOf(item: mt.action)).required()
    };
  }
}

// Provides global access to the "rbac" pack. Only one instance of the pack
// is created. During the creation, other packs that this pack depends on might
// be created as well.
//
extension StimRbacPackExtension on StimpackRoot {
  StimRbac get rbac {
    return _rbac ??= StimRbac(stimpack.model);
  }
}
