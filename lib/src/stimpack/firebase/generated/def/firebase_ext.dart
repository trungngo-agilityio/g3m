part of g3.stimpack.firebase.generated;



class OnStimModelTypeForFirebase {
  StimModelType firestore;

  StimModelType firestoreCollection;

  StimModelType securityRule;

  StimModelType function;

  StimModelType firestoreClient;

  StimModelType functionClient;
}


class OnStimModelFieldForFirebase {
  StimModelField firestoreCollection;

  StimModelField firestoreCollectionSet;
}


class OnStimRbacResourceKindForFirebase {
  StimRbacResourceKind firebase;

  StimRbacResourceKind storage;

  StimRbacResourceKind function;

  StimRbacResourceKind firestore;

  StimRbacResourceKind hosting;

  StimRbacResourceKind firestoreCollection;

  StimRbacResourceKind firestoreDoc;

  StimRbacResourceKind firestoreField;
}


class OnStimRbacResourceForFirebase {
  StimRbacResource firebaseService;

  StimRbacResource storageService;

  StimRbacResource functionService;

  StimRbacResource firestoreService;

  StimRbacResource hostingService;
}



extension OnStimModelTypeForFirebaseExtension on StimModelTypeScope {
  OnStimModelTypeForFirebase get firebase {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimFirebase.stimFirebaseInstance().onStimModelType;
  }
}


extension OnStimModelFieldForFirebaseExtension on StimModelFieldScope {
  OnStimModelFieldForFirebase get firebase {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimFirebase.stimFirebaseInstance().onStimModelField;
  }
}


extension OnStimRbacResourceKindForFirebaseExtension on StimRbacResourceKindScope {
  OnStimRbacResourceKindForFirebase get firebase {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimFirebase.stimFirebaseInstance().onStimRbacResourceKind;
  }
}


extension OnStimRbacResourceForFirebaseExtension on StimRbacResourceScope {
  OnStimRbacResourceForFirebase get firebase {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimFirebase.stimFirebaseInstance().onStimRbacResource;
  }
}
