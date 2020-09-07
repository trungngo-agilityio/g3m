import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_rbac.dart';

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

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------

  final fFirestoreCollectionSet =
      f.setOf(name: 'collections', type: tFirestoreCollection);

  final fSecurityRule = f.of(name: 'rule', type: tSecurityRule);

  final fRequireRbacResource = f.rbac.resource.ref().required();

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
    f.of(name: 'parent', type: tFirestoreCollection),

    // The database instance that this collection belong to.
    f.of(name: 'firestore', type: tFirestore),

    // The sub collection
    fFirestoreCollectionSet,

    // The security rule applied to the collection.
    fSecurityRule,

    /// The rbac resource defined by this collection.
    fRequireRbacResource,
  };

  final condSet = f.rbac.conditionSet;
  final a = rbac.action;
  tSecurityRule.fields = {
    // FIXME: Why need to do ..required(), instead of .required
    condSet.refWith(name: a.createOne)..required(),
    condSet.refWith(name: a.updateOne)..required(),
    condSet.refWith(name: a.findOne)..required(),
    condSet.refWith(name: a.deleteOne)..required(),
    condSet.refWith(name: a.find)..required(),
    condSet.refWith(name: a.delete)..required(),
  };

  stimpackGen(meta, 'lib/src/stimpack', values: {
    t.model.field: _fields,
    t.rbac.resource: _rbacResources,
  });
}

const _rbacResources = {
  'firestore',
  'firestore collection',
  'firestore doc',
  'firestore field',
};

const _fields = {
  'firestore collection',
  'firestore collection set',
};
