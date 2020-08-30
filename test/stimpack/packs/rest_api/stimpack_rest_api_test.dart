import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_rbac.dart';
import 'package:g3m/stimpack_rest_api.dart';
import 'package:test/test.dart';

void main() {
  final api = stimpack.restApi,
      ma = api.modelApi,
      a = api.api,
      k = api.modelApiKind,
      p = api.package;
  final model = stimpack.model, t = model.type, f = model.field, r = model.rule;
  final rbac = stimpack.rbac, g = rbac.accessGrant;

  test('setup', () {
    final kAll =
        k.createOne + k.updateOne + k.findOne + k.deleteOne + k.find + k.delete;

    final gAdmin = g.of('admin access', roles: rbac.accessRole.admin);
    final aUser = ma.of('user api',
        model: t.userProfile, idField: f.id, apis: kAll, required: gAdmin);

    final aSignIn = a.of('sign in',
        request: f.username.required + f.password.required,
        response: f.accessToken);

    final aSignOut = a.of('sign out');

    final aUpdatePassword = a.of(
      'update password',
      request: f.password.required,
    );

    final pAuth = p.of('user',
        modelApis: aUser, apis: aSignIn + aSignOut + aUpdatePassword);
    print(pAuth);
  });
}
