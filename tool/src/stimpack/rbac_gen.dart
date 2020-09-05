import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';

void main() {
  genRbacPack();
}

void genRbacPack() {
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'rbac');

  final tAction = t.symbolOf(name: 'action', package: meta);
  final tResource = t.symbolOf(name: 'resource', package: meta);

  final tGroup = t.symbolOf(name: 'group', package: meta);
  final tRole = t.symbolOf(name: 'role', package: meta);
  final tPolicy = t.symbolOf(name: 'policy', package: meta);
  final tPolicyKind = t.symbolOf(name: 'policy kind', package: meta);

  tGroup.fields = {
    // group can have multiple sub groups
    f.setOf(name: 'groups', type: tGroup),

    // a group can be assigned with multiple roles
    f.setOf(name: 'roles', type: tRole),
  };

  tPolicy.fields = {
    // A policy has a kind, could be accept or deny
    f.of(name: 'kind', type: tPolicyKind).required(),

    // A policy can be applied to a set of resources
    f.setOf(name: 'resources', type: tResource).required(),

    // A policy is applied to a set of actions that can
    // be performed on the resources
    f.setOf(name: 'actions', type: tAction).required(),
  };

  tResource.fields = {
    // A resource might have a parent resource
    f.of(name: 'parent', type: tResource),
  };

  tRole.fields = {
    // a role can have all permissions that all sub roles have.
    f.setOf(name: 'roles', type: tRole),
  };

  stimpackGen(meta, 'lib/src/stimpack', values: {
    tPolicyKind: {'allow', 'deny'},
    tResource: _resources,
    tRole: _roles,
  });
}

final _resources = {
  /// This match any resource in the system
  'any',

  /// This match a database resource
  'database',

  /// This match a database table
  'table',

  /// This match a data field
  'field',

  /// This match an api
  'api',

  /// This match an application
  'app',

  /// This match a feature
  'feature',
};

final _roles = {
  'super admin',
  'admin',
  'user',
  'guest',
};
