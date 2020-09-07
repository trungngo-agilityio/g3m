part of g3.stimpack.rbac.init;

/// This function is called during the initialization of rbac
void _stimInitRbacPack() {
  _buildRoles();
  _buildResources();
  _buildPolicyKind();
  _buildActions();
  _buildConditions();
}

void _buildRoles() {
  final r = _rbac.role;

  // super admin has all permissions
  r.superAdmin = r.of(name: 'super admin', roles: {
    // admin has user permissions
    r.admin = r.of(name: 'admin', roles: {
      // user has limited permissions, including those from guest
      r.user = r.of(name: 'user', roles: {r.guest = r.of(name: 'guest')}),
    }),
  });
}

void _buildResources() {
  final r = _rbac.resource;
  r.any = r.of(name: 'any');
  r.database = r.of(name: 'database');
  r.dataTable = r.of(name: 'data table');
  r.dataRecord = r.of(name: 'data record');
  r.dataField = r.of(name: 'data field');
  r.service = r.of(name: 'service');
  r.serviceApi = r.of(name: 'service api');
  r.app = r.of(name: 'app');
  r.appFeature = r.of(name: 'app feature');
}

void _buildPolicyKind() {
  final k = _rbac.policyKind;
  k.allow = k.of(name: 'allow');
  k.deny = k.of(name: 'deny');
}

void _buildActions() {
  final a = _rbac.action;
  a.createOne = a.of(name: 'create one');
  a.findOne = a.of(name: 'find one');
  a.updateOne = a.of(name: 'update one');
  a.deleteOne = a.of(name: 'delete one');
  a.find = a.of(name: 'find');
  a.delete = a.of(name: 'delete');

  a.read = a.of(name: 'read', actions: {a.findOne, a.find});
  a.write = a.of(name: 'write', actions: {
    a.createOne,
    a.updateOne,
    a.deleteOne,
    a.delete,
  });
  a.readWrite = a.of(name: 'read write', actions: {
    a.read,
    a.write,
  });
  a.access = a.of(name: 'access');
}

void _buildConditions() {
  final c = _rbac.condition, r = _rbac.role;

  c.isUser = c.of(name: 'is user');
  c.isGuest = c.of(name: 'is guest');
  c.isOwner = c.of(name: 'is owner');
  c.isShared = c.of(name: 'is shared');

  c.isInRole = c.of(name: 'is in role');

  c.isInSuperAdminRole = c.of(
    name: 'is in super admin role',
    ifHasRole: r.superAdmin,
  );
  c.isInAdminRole = c.of(name: 'is in admin role', ifHasRole: r.admin);
  c.isInUserRole = c.of(name: 'is in user role', ifHasRole: r.user);
}
