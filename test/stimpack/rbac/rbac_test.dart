import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_rbac.dart';
import 'package:test/test.dart';

void main() {
  final rbac = stimpack.rbac,
      r = rbac.resource,
      p = rbac.policy,
      a = rbac.action,
      c = rbac.condition;

  test('model 1', () {
    final rMainDatabase = r.databaseOf(id: 'main');
    final rBankTable = r.dataTableOf(id: 'bank', database: rMainDatabase);
    final rBankAccount =
        r.dataTableOf(id: 'bank account', database: rMainDatabase);

    final rAdminApp = r.appOf(id: 'admin');
    final rManageMasterDataFeature =
        r.appFeatureOf(id: 'admin', app: rAdminApp);

    final rUserApi = r.serviceOf(id: 'user');
    final rBankCrudApi = r.serviceApiOf(id: 'bank', service: rUserApi);

    final pUserApi = p.allow(
      resources: {rUserApi},
      actions: {a.readWriteDelete},
      conditions: {c.isUser},
    );

    final pBankCrudApiRead = p.allow(
      resources: {rBankCrudApi},
      actions: {a.read},
      conditions: {c.isInAdminRole},
    );

    final pBankCrudApiWrite = p.allow(
      resources: {rBankCrudApi},
      actions: {a.readWrite},
      conditions: {c.isInSuperAdminRole},
    );
  });
}
