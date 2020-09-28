part of g3.stimpack.firebase.generated;



class StimFirebaseFirestore extends StimModelSymbol<StimFirebaseFirestore> {
  Set<StimFirebaseFirestoreCollection> collections;

  StimRbacResource resource;

  StimFirebaseFirestore();


  /// Creates a new "firestore" of [StimFirebaseFirestore] type.
  StimFirebaseFirestore copyWith({@required
  dynamic name, Set<StimFirebaseFirestoreCollection> collections, @required
  StimRbacResource resource, Set<StimModelTag> tags}) {
    return StimFirebaseFirestore()
        ..name = StimName.of(name ?? this.name)
        ..collections = collections ?? this.collections
        ..resource = resource ?? this.resource
        ..tags = tags ?? this.tags;
  }
}


class StimFirebaseFirestoreScope {
  /// Creates a new "firestore" of [StimFirebaseFirestore] type.
  StimFirebaseFirestore of({@required
  dynamic name, Set<StimFirebaseFirestoreCollection> collections, @required
  StimRbacResource resource, Set<StimModelTag> tags}) {
    return StimFirebaseFirestore()
        ..name = StimName.of(name)
        ..collections = collections ?? {}
        ..resource = resource
        ..tags = tags ?? {};
  }
}
