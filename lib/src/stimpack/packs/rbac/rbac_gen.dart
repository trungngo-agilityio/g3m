import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_model.dart';

/// TODO
/// ============================================================================

final m = stimpack.meta,
    t = m.type,
    f = m.field,
    p = m.preset,
    v = m.value,
    k = m.kind,
    model = stimpack.model;

void main() {
  final pack = stimpack.meta.pack.of('rbac');

  // ---------------------------------------------------------------------------
  // Types
  // ---------------------------------------------------------------------------

  final tResource = t.of('resource',
      values: v.ofNames([
        'database',
        'table',
        'feature',
      ]));

  final tAction = t.of('action',
      values: v.ofNames([
        'create one',
        'update one',
        'delete one',
        'find one',
        'find',
        'delete',
      ]));

  final tGrant = t.of('access grant', values: v.ofNames(['full']));
  final tRole = t.of('access role',
      values: v.ofNames([
        'super admin',
        'admin',
        'manager',
        'user',
        'guest',
      ]));

  final tPermission = t.of('access permission');

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------
  final fPermissions = f.listOf('permissions', type: tPermission);
  final fRoles = f.listOf('roles', type: tRole);

  // Permission specifies which action can be done on which resources.
  tPermission.fields +=
      f.of('resource', type: tResource) + f.of('action', type: tAction);

  // A role grant consists of permissions
  tRole.fields += fPermissions;

  // A package consists of role & permissions
  tGrant.fields += fRoles + fPermissions;

  // ---------------------------------------------------------------------------
  // Type Field Mapping
  // ---------------------------------------------------------------------------

  // ---------------------------------------------------------------------------
  // Builds final pack
  // ---------------------------------------------------------------------------
  pack.types += tGrant + tRole + tPermission + tResource + tAction;

  pack.types.pack.set(pack);

  stimpackGen(pack, 'lib/src/stimpack/packs/rbac');
}
