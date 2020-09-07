import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_rbac.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';

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

  final fFirestoreCollectionSecurityRule =
      f.of(name: 'rule', type: tSecurityRule);

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------

  // a firestore database has many root collections
  tFirestore.fields = {
    fFirestoreCollectionSet,
  };

  // A firestore collection has sub collections.
  // It also refers to a rbac resource for security checking.
  tFirestoreCollection.fields = {
    fFirestoreCollectionSet,
    fFirestoreCollectionSecurityRule,
  };

  final condSet = f.rbac.conditionSet;
  final a = rbac.action;

  tSecurityRule.fields = {
    condSet.refWith(name: a.createOne),
    condSet.refWith(name: a.updateOne),
    condSet.refWith(name: a.findOne),
    condSet.refWith(name: a.deleteOne),
    condSet.refWith(name: a.find),
    condSet.refWith(name: a.delete),
    condSet.refWith(name: a.read),
    condSet.refWith(name: a.write),
    condSet.refWith(name: a.readWrite),
  };

  stimpackGen(meta, 'lib/src/stimpack', values: {
    t.model.field: _fields,
  });
}

const _fields = {
  'firestore collection',
  'firestore collection set',
};
