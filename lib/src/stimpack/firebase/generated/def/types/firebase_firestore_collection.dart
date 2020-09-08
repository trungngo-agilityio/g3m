part of g3.stimpack.firebase.generated;



class StimFirebaseFirestoreCollection extends StimModelSymbol<StimFirebaseFirestoreCollection> {
  StimFirebaseFirestore firestore;

  StimFirebaseFirestoreCollection parent;

  StimModelType model;

  Set<StimFirebaseFirestoreCollection> collections;

  StimFirebaseSecurityRule rule;

  StimRbacResource resource;

  StimFirebaseFirestoreCollection();


  StimFirebaseFirestoreCollection ref() {
    return StimFirebaseFirestoreCollectionRef()..symbol = this;
  }

  /// Creates a new "firestoreCollection" of [StimFirebaseFirestoreCollection] type.
  StimFirebaseFirestoreCollection refWith({dynamic name, StimFirebaseFirestore firestore, StimFirebaseFirestoreCollection parent, StimModelType model, Set<StimFirebaseFirestoreCollection> collections, StimFirebaseSecurityRule rule, StimRbacResource resource, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (firestore != null) {
      res.firestore = firestore;
    }

    if (parent != null) {
      res.parent = parent;
    }

    if (model != null) {
      res.model = model;
    }

    if (collections != null) {
      res.collections = collections;
    }

    if (rule != null) {
      res.rule = rule;
    }

    if (resource != null) {
      res.resource = resource;
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
  StimFirebaseFirestoreCollection of({dynamic name, @required
  StimFirebaseFirestore firestore, StimFirebaseFirestoreCollection parent, @required
  StimModelType model, Set<StimFirebaseFirestoreCollection> collections, StimFirebaseSecurityRule rule, @required
  StimRbacResource resource, Set<StimModelTag> tags}) {
    return StimFirebaseFirestoreCollection()
        ..name = StimName.of(name)
        ..firestore = firestore
        ..parent = parent
        ..model = model
        ..collections = collections ?? {}
        ..rule = rule
        ..resource = resource
        ..tags = tags ?? {};
  }
}
