part of g3.stimpack.firebase.generated;



class StimFirebaseFirestoreClient extends StimModelSymbol<StimFirebaseFirestoreClient> {
  Set<StimFirebaseFirestoreCollection> collections;

  Set<StimRestCrudApi> crudApis;

  StimFirebaseFirestoreClient();


  StimFirebaseFirestoreClient ref() {
    return StimFirebaseFirestoreClientRef()..symbol = this;
  }

  /// Creates a new "firestoreClient" of [StimFirebaseFirestoreClient] type.
  StimFirebaseFirestoreClient refWith({dynamic name, Set<StimFirebaseFirestoreCollection> collections, Set<StimRestCrudApi> crudApis, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (collections != null) {
      res.collections = collections;
    }

    if (crudApis != null) {
      res.crudApis = crudApis;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimFirebaseFirestoreClientRef extends StimSymbolRef<StimFirebaseFirestoreClient> implements StimFirebaseFirestoreClient {

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
