part of g3.stimpack.rbac.init;

/// This function is called during the initialization of rbac
void _stimInitRbacPack() {
  _buildFields();
  _buildRoles();
  _buildResources();
  _buildPolicyKind();
  _buildActions();
  _buildConditions();
}

/// Builds common fields for other package to use.
void _buildFields() {
  final t = stimpack.model.type,
      f = stimpack.model.field,
      mf = f.rbac,
      mt = t.rbac;

  mf.group = f.of(name: 'group', type: mt.group);
  mf.groupSet = f.setOf(name: 'groups', type: mt.group);

  mf.policy = f.of(name: 'policy', type: mt.policy);
  mf.policySet = f.setOf(name: 'policies', type: mt.policy);

  mf.resource = f.of(name: 'resource', type: mt.resource);
  mf.resourceSet = f.setOf(name: 'resources', type: mt.resource);

  mf.role = f.of(name: 'role', type: mt.role);
  mf.roleSet = f.setOf(name: 'roles', type: mt.role);

  mf.action = f.of(name: 'action', type: mt.action);
  mf.actionSet = f.setOf(name: 'actions', type: mt.action);

  mf.condition = f.of(name: 'condition', type: mt.condition);
  mf.conditionSet = f.setOf(name: 'conditions', type: mt.condition);
}

/// Builds common security roles for other package to use.
void _buildRoles() {
  final r = _rbac.role;

  // super admin has all permissions
  r.superAdmin = r.of(name: 'super admin', roles: {
    // admin has user permissions
    r.admin = r.of(name: 'admin', roles: {
      // user has limited permissions, including those from guest
      r.user = r.of(name: 'user'),
    }),
  });

  r.guest = r.of(name: 'guest');
}

void _buildResourceKind() {
  final r = _rbac.resourceKind;
  r.root = r.of(name: 'root');
}

void _buildResources() {
  final r = _rbac.resource;
  r.root = r.of(name: 'root', kind: _rbac.resourceKind.root);
}

void _buildPolicyKind() {
  final k = _rbac.policyKind;
  k.allow = k.of(name: 'allow');
  k.deny = k.of(name: 'deny');
}

void _buildActions() {
  final a = _rbac.action;

  // read action
  a.find = a.of(name: 'find');
  a.findOne = a.of(name: 'find one');

  // write action
  a.createOne = a.of(name: 'create one');
  a.updateOne = a.of(name: 'update one');

  // delete action
  a.deleteOne = a.of(name: 'delete one');
  a.delete = a.of(name: 'delete');

  a.read = a.of(name: 'read', actions: {a.findOne, a.find});
  a.write = a.of(name: 'write', actions: {
    a.createOne,
    a.updateOne,
  });

  a.readWrite = a.of(name: 'read write', actions: {
    a.read,
    a.write,
  });

  a.readWriteDelete = a.of(name: 'read write delete', actions: {
    a.readWrite,
    a.deleteOne,
    a.delete,
  });
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
