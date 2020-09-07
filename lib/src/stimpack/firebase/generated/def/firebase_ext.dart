part of g3.stimpack.firebase.generated;



class StimFirebaseOnStimModelType {
  StimModelType firestore;

  StimModelType firestoreCollection;
}



extension StimFirebaseOnStimModelTypeExtension on StimModelTypeScope {
  StimFirebaseOnStimModelType get firebase {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimFirebase.stimFirebaseInstance().onStimModelType;
  }
}
