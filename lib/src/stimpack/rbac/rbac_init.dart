part of g3.stimpack.rbac.generated;

/// This function is called during the initialization of rbac
void stimInitRbacPack(StimRbac pack) {
  _buildRoles(pack);
  _buildResources(pack);
  _buildPolicyKind(pack);
}

void _buildRoles(StimRbac pack) {
  final r = pack.role;

  // super admin has all permissions
  r.superAdmin = r.of(name: 'super admin', roles: {
    // admin has user permissions
    r.admin = r.of(name: 'admin', roles: {
      // user has limited permissions, including those from guest
      r.user = r.of(name: 'user', roles: {r.guest = r.of(name: 'guest')}),
    }),
  });
}

void _buildResources(StimRbac pack) {
  final r = pack.resource;
  r.any = r.of(name: 'any');
  r.database = r.of(name: 'database');
  r.table = r.of(name: 'table');
  r.field = r.of(name: 'field');
  r.api = r.of(name: 'api');
  r.app = r.of(name: 'app');
  r.feature = r.of(name: 'feature');
}

void _buildPolicyKind(StimRbac pack) {
  final k = pack.policyKind;
  k.allow = k.of(name: 'allow');
  k.deny = k.of(name: 'deny');
}
