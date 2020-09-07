part of g3.stimpack.firebase.generated;



class StimFirebaseFirestoreCollection extends StimModelSymbol<StimFirebaseFirestoreCollection> {
  Set<StimFirebaseFirestoreCollection> collections;

  StimFirebaseSecurityRule rule;

  StimFirebaseFirestoreCollection();


  StimFirebaseFirestoreCollection ref() {
    return StimFirebaseFirestoreCollectionRef()..symbol = this;
  }

  /// Creates a new "firestoreCollection" of [StimFirebaseFirestoreCollection] type.
  StimFirebaseFirestoreCollection refWith({dynamic name, Set<StimFirebaseFirestoreCollection> collections, StimFirebaseSecurityRule rule, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (collections != null) {
      res.collections = collections;
    }

    if (rule != null) {
      res.rule = rule;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimFirebaseFirestoreCollectionRef extends StimSymbolRef<StimFirebaseFirestoreCollection> implements StimFirebaseFirestoreCollection {

}


class StimFirebaseFirestoreCollectionScope {
  /// Creates a new "firestoreCollection" of [StimFirebaseFirestoreCollection] type.
  StimFirebaseFirestoreCollection of({dynamic name, Set<StimFirebaseFirestoreCollection> collections, StimFirebaseSecurityRule rule, Set<StimModelTag> tags}) {
    return StimFirebaseFirestoreCollection()
        ..name = StimName.of(name)
        ..collections = collections ?? {}
        ..rule = rule
        ..tags = tags ?? {};
  }
}
