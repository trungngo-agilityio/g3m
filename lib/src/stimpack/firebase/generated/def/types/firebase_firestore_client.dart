part of g3.stimpack.firebase.generated;



class StimFirebaseFirestoreClient extends StimModelSymbol<StimFirebaseFirestoreClient> {
  Set<StimFirebaseFirestoreCollection> collections;

  Set<StimRestCrudApi> crudApis;

  StimFirebaseFirestoreClient();


  /// Creates a new "firestoreClient" of [StimFirebaseFirestoreClient] type.
  StimFirebaseFirestoreClient copyWith({@required
  dynamic name, Set<StimFirebaseFirestoreCollection> collections, Set<StimRestCrudApi> crudApis, Set<StimModelTag> tags}) {
    return StimFirebaseFirestoreClient()
        ..name = StimName.of(name ?? this.name)
        ..collections = collections ?? this.collections
        ..crudApis = crudApis ?? this.crudApis
        ..tags = tags ?? this.tags;
  }
}


class StimFirebaseFirestoreClientScope {
  /// Creates a new "firestoreClient" of [StimFirebaseFirestoreClient] type.
  StimFirebaseFirestoreClient of({@required
  dynamic name, Set<StimFirebaseFirestoreCollection> collections, Set<StimRestCrudApi> crudApis, Set<StimModelTag> tags}) {
    return StimFirebaseFirestoreClient()
        ..name = StimName.of(name)
        ..collections = collections ?? {}
        ..crudApis = crudApis ?? {}
        ..tags = tags ?? {};
  }
}
