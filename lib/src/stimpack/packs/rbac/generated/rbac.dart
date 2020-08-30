library g3.stimpack.rbac.generated;


import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';
part 'rbac_presets.dart';
part '../rbac_init.dart';
part 'rbac__access_grant.dart';
part 'rbac__access_grant__roles.dart';
part 'rbac__access_grant__permissions.dart';
part 'rbac__access_role.dart';
part 'rbac__access_role__permissions.dart';
part 'rbac__access_permission.dart';
part 'rbac__access_permission__resource.dart';
part 'rbac__access_permission__action.dart';
part 'rbac__resource.dart';
part 'rbac__action.dart';



abstract class StimRbac {
  StimMetaPack get meta;
  StimRbacAccessGrantScope get accessGrant;
  StimRbacAccessRoleScope get accessRole;
  StimRbacAccessPermissionScope get accessPermission;
  StimRbacResourceScope get resource;
  StimRbacActionScope get action;
}


class StimRbacImpl  implements StimRbac {
  StimMetaPack _meta;

  _StimRbacAccessGrantScopeImpl _accessGrant;

  _StimRbacAccessRoleScopeImpl _accessRole;

  _StimRbacAccessPermissionScopeImpl _accessPermission;

  _StimRbacResourceScopeImpl _resource;

  _StimRbacActionScopeImpl _action;

  StimMetaXTypeXPreset _metaXTypeXPreset;

  @override
  StimMetaPack get meta {
    return _meta;
  }
  @override
  _StimRbacAccessGrantScopeImpl get accessGrant {
    return _accessGrant;
  }
  @override
  _StimRbacAccessRoleScopeImpl get accessRole {
    return _accessRole;
  }
  @override
  _StimRbacAccessPermissionScopeImpl get accessPermission {
    return _accessPermission;
  }
  @override
  _StimRbacResourceScopeImpl get resource {
    return _resource;
  }
  @override
  _StimRbacActionScopeImpl get action {
    return _action;
  }

  StimRbacImpl() {
    _accessGrant = _StimRbacAccessGrantScopeImpl();
    _accessRole = _StimRbacAccessRoleScopeImpl();
    _accessPermission = _StimRbacAccessPermissionScopeImpl();
    _resource = _StimRbacResourceScopeImpl();
    _action = _StimRbacActionScopeImpl();
    _metaXTypeXPreset = StimMetaXTypeXPreset();
  }


  void init() {
    _accessGrant.init();
    _accessRole.init();
    _accessPermission.init();
    _resource.init();
    _action.init();
    _metaXTypeXPreset.init(stimpack.meta.type);
    _buildMeta();
    stimInitRbacPack(this);
  }

  void _buildMeta() {
    final meta = stimpack.meta;
    final pack = meta.pack.of('rbac');
    final f = meta.field, t = meta.type, p = meta.preset, v = meta.value, k = meta.kind;

    t.forRbac.accessGrant.fields = f.noneSet +
        f.of('roles', kind: k.set, type: t.forRbac.accessRole) + 
        f.of('permissions', kind: k.set, type: t.forRbac.accessPermission);

    t.forRbac.accessRole.fields = f.noneSet +
        f.of('permissions', kind: k.set, type: t.forRbac.accessPermission);

    t.forRbac.accessPermission.fields = f.noneSet +
        f.of('resource', type: t.forRbac.resource) + 
        f.of('action', type: t.forRbac.action);

    pack.presets = p.noneSet +
        p.of('', type: t.forMeta.type, values: 
              v.of('accessGrant') + 
              v.of('accessRole') + 
              v.of('accessPermission') + 
              v.of('resource') + 
              v.of('action'),);

    pack.types = t.forRbac.all;
    pack.types.pack.set(pack);
    _meta = pack;
  }
}
StimRbac  _stimRbac;

extension StimRbacStimpackExtension on Stimpack {
  StimRbac get rbac {
    if (_stimRbac == null) {
      final impl = _stimRbac = StimRbacImpl();
      impl.init();
      return _stimRbac;
    }
    
    return _stimRbac;
  }
}
    