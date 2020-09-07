part of g3.stimpack.firebase.generated;



class StimFirebaseFirestore extends StimModelSymbol<StimFirebaseFirestore> {
  Set<StimFirebaseFirestoreCollection> collections;

  StimFirebaseFirestore();


  StimFirebaseFirestore ref() {
    return StimFirebaseFirestoreRef()..symbol = this;
  }

  /// Creates a new "firestore" of [StimFirebaseFirestore] type.
  StimFirebaseFirestore refWith({dynamic name, Set<StimFirebaseFirestoreCollection> collections, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (collections != null) {
      res.collections = collections;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimFirebaseFirestoreRef extends StimSymbolRef<StimFirebaseFirestore> implements StimFirebaseFirestore {

}


class StimFirebaseFirestoreScope {
  /// Creates a new "firestore" of [StimFirebaseFirestore] type.
  StimFirebaseFirestore of({dynamic name, Set<StimFirebaseFirestoreCollection> collections, Set<StimModelTag> tags}) {
    return StimFirebaseFirestore()
        ..name = StimName.of(name)
        ..collections = collections ?? {}
        ..tags = tags ?? {};
  }
}
