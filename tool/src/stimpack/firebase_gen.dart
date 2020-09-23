import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_rbac.dart';
import 'package:g3m/stimpack_rest.dart';

void main() {
  genFirebasePack();
}

void genFirebasePack() {
  final rbac = stimpack.rbac;
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'firebase');

  // ---------------------------------------------------------------------------
  // Types
  // ---------------------------------------------------------------------------
  // Firestore database
  final tFirestore = t.symbolOf(name: 'firestore', package: meta);

  // Firestore collection
  final tFirestoreCollection =
      t.symbolOf(name: 'firestore collection', package: meta);

  // Firestore collection security rule
  final tSecurityRule = t.symbolOf(name: 'security rule', package: meta);

  // Cloud function
  final tFunction = t.symbolOf(name: 'function', package: meta);

  // Api client that access data directly from firestore.
  final tFirestoreClient = t.symbolOf(name: 'firestore client', package: meta);

  // Api client that call apis exposed by google cloud functions.
  final tFunctionClient = t.symbolOf(name: 'function client', package: meta);

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------

  final fFirestoreCollectionSet =
      f.setOf(name: 'collections', type: tFirestoreCollection);

  final fSecurityRule = f.of(name: 'rule', type: tSecurityRule);

  final fRequireRbacResource = f.rbac.resource.copyWith()..required();

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------

  // a firestore database has many root collections
  tFirestore.fields = {
    // The fire store collection set
    fFirestoreCollectionSet,

    // The rbac resource defined by this.
    fRequireRbacResource,
  };

  // A firestore collection has sub collections, an optional parent collection
  // It also refers to a rbac resource for security checking.
  tFirestoreCollection.fields = {
    // The database instance that this collection belong to.
    f.of(name: 'firestore', type: tFirestore)..required(),

    f.of(name: 'parent', type: tFirestoreCollection),

    // The data model that defines this collection
    f.of(name: 'model', type: t.model.type)..required(),

    // A field in models' field set used as the identifier
    f.of(name: 'id field', type: t.model.field)..required(),

    // The sub collections
    fFirestoreCollectionSet,

    // The security rule applied to the collection.
    fSecurityRule,

    /// The rbac resource defined by this collection.
    fRequireRbacResource,
  };

  tFunction.fields = {
    /// The rbac resource defined by this function.
    fRequireRbacResource,
  };

  tFirestoreClient.fields = {
    // A firestore client needs to work with a set of firestore collection.
    fFirestoreCollectionSet,

    // A firestore client comes with a set of crud apis.
    f.setOf(name: 'crud apis', type: t.rest.crudApi),
  };

  tFunctionClient.fields = {
    // A function client needs to work with a set of google cloud functions.
    f.setOf(name: 'functions', type: tFunction),
  };

  final a = rbac.action;

  StimModelField cond(StimRbacAction action) =>
      f.setOf(name: action, type: t.rbac.condition)..required();

  tSecurityRule.fields = {
    cond(a.createOne),
    cond(a.updateOne),
    cond(a.findOne),
    cond(a.deleteOne),
    cond(a.find),
    cond(a.delete),
  };

  stimpackGen(meta, 'lib/src/stimpack', values: {
    t.model.field: _fields,
    t.rbac.resourceKind: _rbacResourceKinds,
    t.rbac.resource: _rbacResources,
  });
}

const _rbacResourceKinds = {
  'firebase',
  'storage',
  'function',
  'firestore',
  'hosting',
  'firestore collection',
  'firestore doc',
  'firestore field',
};

const _rbacResources = {
  'firebase service',
  'storage service',
  'function service',
  'firestore service',
  'hosting service',
};

const _fields = {
  'firestore collection',
  'firestore collection set',
};
