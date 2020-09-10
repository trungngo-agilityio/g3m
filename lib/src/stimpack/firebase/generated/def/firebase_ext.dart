part of g3.stimpack.firebase.generated;



class StimFirebaseOnStimModelType {
  StimModelType firestore;

  StimModelType firestoreCollection;

  StimModelType securityRule;

  StimModelType function;

  StimModelType firestoreClient;

  StimModelType functionClient;
}


class StimFirebaseOnStimModelField {
  StimModelField firestoreCollection;

  StimModelField firestoreCollectionSet;
}


class StimFirebaseOnStimRbacResourceKind {
  StimRbacResourceKind firebase;

  StimRbacResourceKind storage;

  StimRbacResourceKind function;

  StimRbacResourceKind firestore;

  StimRbacResourceKind hosting;

  StimRbacResourceKind firestoreCollection;

  StimRbacResourceKind firestoreDoc;

  StimRbacResourceKind firestoreField;
}


class StimFirebaseOnStimRbacResource {
  StimRbacResource firebaseService;

  StimRbacResource storageService;

  StimRbacResource functionService;

  StimRbacResource firestoreService;

  StimRbacResource hostingService;
}



extension StimFirebaseOnStimModelTypeExtension on StimModelTypeScope {
  StimFirebaseOnStimModelType get firebase {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimFirebase.stimFirebaseInstance().onStimModelType;
  }
}


extension StimFirebaseOnStimModelFieldExtension on StimModelFieldScope {
  StimFirebaseOnStimModelField get firebase {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimFirebase.stimFirebaseInstance().onStimModelField;
  }
}


extension StimFirebaseOnStimRbacResourceKindExtension on StimRbacResourceKindScope {
  StimFirebaseOnStimRbacResourceKind get firebase {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimFirebase.stimFirebaseInstance().onStimRbacResourceKind;
  }
}


extension StimFirebaseOnStimRbacResourceExtension on StimRbacResourceScope {
  StimFirebaseOnStimRbacResource get firebase {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimFirebase.stimFirebaseInstance().onStimRbacResource;
  }
}
