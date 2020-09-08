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

  /// Scope class for constructing all "securityRule" symbols, 
  /// typed of [StimFirebaseSecurityRule]."
  final StimFirebaseSecurityRuleScope securityRule;

  final StimFirebaseOnStimModelType onStimModelType;

  final StimFirebaseOnStimModelField onStimModelField;

  final StimFirebaseOnStimRbacResource onStimRbacResource;

  StimFirebase(StimModel model, StimRbac rbac):
      firestore = StimFirebaseFirestoreScope(),
      firestoreCollection = StimFirebaseFirestoreCollectionScope(),
      securityRule = StimFirebaseSecurityRuleScope(),
      onStimModelType = StimFirebaseOnStimModelType(),
      onStimModelField = StimFirebaseOnStimModelField(),
      onStimRbacResource = StimFirebaseOnStimRbacResource(),
      super('firebase');


  /// Provides global access to the "firebase" pack. Only one instance of the pack 
  /// is created. During the creation, other packs that this pack depends on might 
  /// be created as well.
  static StimFirebase stimFirebaseInstance() {
    if (_firebase == null) {
      _firebase = StimFirebase(stimpack.model, stimpack.rbac);
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

    /// Builds type "securityRule"
    mt.securityRule = t.symbolOf(name: 'securityRule', package: mp);

    /// Builds fields for type "firestore"
    mt.firestore.fields = {
      /// field "firestore"
      f.of(name: 'collections', type: t.setOf(item: mt.firestoreCollection)),

      /// field "firestore"
      f.of(name: 'resource', type: t.rbac.resource).required()
    };

    /// Builds fields for type "firestoreCollection"
    mt.firestoreCollection.fields = {
      /// field "firestoreCollection"
      f.of(name: 'firestore', type: mt.firestore).required(),

      /// field "firestoreCollection"
      f.of(name: 'parent', type: mt.firestoreCollection),

      /// field "firestoreCollection"
      f.of(name: 'model', type: t.model.type).required(),

      /// field "firestoreCollection"
      f.of(name: 'collections', type: t.setOf(item: mt.firestoreCollection)),

      /// field "firestoreCollection"
      f.of(name: 'rule', type: mt.securityRule),

      /// field "firestoreCollection"
      f.of(name: 'resource', type: t.rbac.resource).required()
    };

    /// Builds fields for type "securityRule"
    mt.securityRule.fields = {
      /// field "securityRule"
      f.of(name: 'create one', type: t.setOf(item: t.rbac.condition)).required(),

      /// field "securityRule"
      f.of(name: 'update one', type: t.setOf(item: t.rbac.condition)).required(),

      /// field "securityRule"
      f.of(name: 'find one', type: t.setOf(item: t.rbac.condition)).required(),

      /// field "securityRule"
      f.of(name: 'delete one', type: t.setOf(item: t.rbac.condition)).required(),

      /// field "securityRule"
      f.of(name: 'find', type: t.setOf(item: t.rbac.condition)).required(),

      /// field "securityRule"
      f.of(name: 'delete', type: t.setOf(item: t.rbac.condition)).required()
    };
  }
}
