import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';

void main() {
  genFirebasePack();
}

void genFirebasePack() {
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'firebase');

  // ---------------------------------------------------------------------------
  // Types
  // ---------------------------------------------------------------------------
  final tFirestore = t.symbolOf(name: 'firestore', package: meta);
  final tFirestoreCollection =
      t.symbolOf(name: 'firestore collection', package: meta);

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------
  final tFirestoreCollectionSet =
      f.setOf(name: 'collections', type: tFirestoreCollection);

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------

  tFirestore.fields = {tFirestoreCollectionSet};

  stimpackGen(meta, 'lib/src/stimpack', values: {});
}
