part of g3.stimpack.firebase.generated;


/// The only instance of the [StimFirebase] pack.
StimFirebase _firebase;



class StimFirebase extends StimPack {
  StimModelPackage _metaPackage;

  /// Scope class for constructing all "firestore" symbols, 
  /// typed of [StimFirebaseFirestore]."
  final StimFirebaseFirestoreScope firestore;

  /// Scope class for constructing all "firestoreCollection" symbols, 
  /// typed of [StimFirebaseFirestoreCollection]."
  final StimFirebaseFirestoreCollectionScope firestoreCollection;

  final StimFirebaseOnStimModelType onStimModelType;

  StimFirebase(StimModel model):
      firestore = StimFirebaseFirestoreScope(),
      firestoreCollection = StimFirebaseFirestoreCollectionScope(),
      onStimModelType = StimFirebaseOnStimModelType(),
      super('firebase');


  /// Provides global access to the "firebase" pack. Only one instance of the pack 
  /// is created. During the creation, other packs that this pack depends on might 
  /// be created as well.
  static StimFirebase stimFirebaseInstance() {
    if (_firebase == null) {
      _firebase = StimFirebase(stimpack.model);
      _firebase._init();
    }
    return _firebase;
  }

  void _init() {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();
  }

  void _buildMeta() {
    final m = stimpack.model, f = m.field, t = m.type;
    final mp = _metaPackage = m.package.of(name: 'firebase');
    final mt = onStimModelType;
    /// Builds type "firestore"
    mt.firestore = t.symbolOf(name: 'firestore', package: mp);

    /// Builds type "firestoreCollection"
    mt.firestoreCollection = t.symbolOf(name: 'firestoreCollection', package: mp);

    /// Builds fields for type "firestore"
    mt.firestore.fields = {
      /// field "firestore"
      f.of(name: 'collections', type: t.setOf(item: mt.firestoreCollection))
    };
  }
}
