part of g3.stimpack.rbac;

StimRbac _rbac;

extension StimRbacExtension on StimpackRoot {
  StimRbac get rbac {
    return _rbac ??= StimRbac();
  }
}

class StimRbac extends StimPack {
  final StimRbacGroupScope group;
  final StimRbacRoleScope role;
  final StimRbacResourceScope resource;
  final StimRbacActionScope action;
  final StimRbacPolicyScope policy;
  final StimRbacPolicyKindScope policyKind;

  StimRbac()
      : group = StimRbacGroupScope(),
        role = StimRbacRoleScope(),
        resource = StimRbacResourceScope(),
        action = StimRbacActionScope(),
        policy = StimRbacPolicyScope(),
        policyKind = StimRbacPolicyKindScope(),
        super('rbac') {
    _actions();
    _resources();
    _roles();
    _policyKinds();
  }

  void _actions() {
    action
      ..read = action.of(name: 'read')
      ..write = action.of(name: 'write')
      ..list = action.of(name: 'list');
  }

  void _resources() {
    resource
      ..any = resource.of(name: 'any')
      ..database = resource.of(name: 'database')
      ..table = resource.of(name: 'table')
      ..field = resource.of(name: 'field')
      ..api = resource.of(name: 'api')
      ..app = resource.of(name: 'app')
      ..feature = resource.of(name: 'feature');
  }

  void _roles() {
    role
      ..superAdmin = role.of(name: 'super admin')
      ..admin = role.of(name: 'admin')
      ..user = role.of(name: 'user')
      ..guest = role.of(name: 'guest');
  }

  void _policyKinds() {
    policyKind
      ..allow = policyKind.of(name: 'allow')
      ..deny = policyKind.of(name: 'deny');
  }
}
