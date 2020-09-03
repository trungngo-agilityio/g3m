library g3.stimpack.rbac.generated;


import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:meta/meta.dart';
import 'package:g3m/stimpack_model.dart';
part '../rbac_init.dart';
part 'rbac_action.dart';
part 'rbac_resource.dart';
part 'rbac_group.dart';
part 'rbac_role.dart';
part 'rbac_policy.dart';
part 'rbac_policy_kind.dart';


/// The only instance of the [StimRbac] pack.
StimRbac _rbac;



class StimRbac extends StimPack {
  final StimRbacTypeMeta meta;

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


  StimRbac(StimModel model):
      meta = StimRbacTypeMeta(),
      action = StimRbacActionScope(),
      resource = StimRbacResourceScope(),
      group = StimRbacGroupScope(),
      role = StimRbacRoleScope(),
      policy = StimRbacPolicyScope(),
      policyKind = StimRbacPolicyKindScope(),
      super('rbac') {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();

    /// Call custom pack initialization code, this code is
    /// not overwritten during pack re-generation. 
    stimInitRbacPack(this);
  }


  void _buildMeta() {
    final m = stimpack.model;
    final mp = _metaPackage = m.package.of(name: 'rbac');
    final f = m.field, t = m.type;


    /// Builds type "action"
    meta.action = t.symbolOf(name: 'action', package: mp);

    /// Builds type "resource"
    meta.resource = t.symbolOf(name: 'resource', package: mp, values: {
      'any',
      'database',
      'table',
      'field',
      'api',
      'app',
      'feature'
    });

    /// Builds type "group"
    meta.group = t.symbolOf(name: 'group', package: mp);

    /// Builds type "role"
    meta.role = t.symbolOf(name: 'role', package: mp, values: {
      'super admin',
      'admin',
      'user',
      'guest'
    });

    /// Builds type "policy"
    meta.policy = t.symbolOf(name: 'policy', package: mp);

    /// Builds type "policyKind"
    meta.policyKind = t.symbolOf(name: 'policyKind', package: mp, values: {
      'allow',
      'deny'
    });


    /// Builds fields for type "resource"
    meta.resource.fields = {
      /// field "resource"
      f.of(name: 'parent', type: meta.resource)
    };


    /// Builds fields for type "group"
    meta.group.fields = {
      /// field "group"
      f.of(name: 'groups', type: t.setOf(item: meta.group)),


      /// field "group"
      f.of(name: 'roles', type: t.setOf(item: meta.role))
    };


    /// Builds fields for type "role"
    meta.role.fields = {
      /// field "role"
      f.of(name: 'roles', type: t.setOf(item: meta.role))
    };


    /// Builds fields for type "policy"
    meta.policy.fields = {
      /// field "policy"
      f.of(name: 'kind', type: meta.policyKind).required(),


      /// field "policy"
      f.of(name: 'resources', type: t.setOf(item: meta.resource)).required(),


      /// field "policy"
      f.of(name: 'actions', type: t.setOf(item: meta.action)).required()
    };
  }
}


class StimRbacTypeMeta {
  StimModelType action;

  StimModelType resource;

  StimModelType group;

  StimModelType role;

  StimModelType policy;

  StimModelType policyKind;
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


extension StimRbacTypeMetaExtension on StimModelTypeScope {
  StimRbacTypeMeta get rbac {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return stimpack.rbac.meta;
  }
}
