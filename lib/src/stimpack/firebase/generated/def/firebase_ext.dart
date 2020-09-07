part of g3.stimpack.firebase.generated;



class StimFirebaseOnStimModelType {
  StimModelType firestore;

  StimModelType firestoreCollection;

  StimModelType securityRule;
}


class StimFirebaseOnStimModelField {
  StimModelField firestoreCollection;

  StimModelField firestoreCollectionSet;
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
