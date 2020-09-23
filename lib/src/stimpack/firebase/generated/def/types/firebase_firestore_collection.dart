part of g3.stimpack.firebase.generated;



class StimFirebaseFirestoreCollection extends StimModelSymbol<StimFirebaseFirestoreCollection> {
  StimFirebaseFirestore firestore;

  StimFirebaseFirestoreCollection parent;

  StimModelType model;

  StimModelField idField;

  Set<StimFirebaseFirestoreCollection> collections;

  StimFirebaseSecurityRule rule;

  StimRbacResource resource;

  StimFirebaseFirestoreCollection();


  /// Creates a new "firestoreCollection" of [StimFirebaseFirestoreCollection] type.
  StimFirebaseFirestoreCollection copyWith({@required
  dynamic name, @required
  StimFirebaseFirestore firestore, StimFirebaseFirestoreCollection parent, @required
  StimModelType model, @required
  StimModelField idField, Set<StimFirebaseFirestoreCollection> collections, StimFirebaseSecurityRule rule, @required
  StimRbacResource resource, Set<StimModelTag> tags}) {
    return StimFirebaseFirestoreCollection()
        ..name = StimName.of(name ?? this.name)
        ..firestore = firestore ?? this.firestore
        ..parent = parent ?? this.parent
        ..model = model ?? this.model
        ..idField = idField ?? this.idField
        ..collections = collections ?? this.collections
        ..rule = rule ?? this.rule
        ..resource = resource ?? this.resource
        ..tags = tags ?? this.tags;
  }
}


class StimFirebaseFirestoreCollectionScope {
  /// Creates a new "firestoreCollection" of [StimFirebaseFirestoreCollection] type.
  StimFirebaseFirestoreCollection of({@required
  dynamic name, @required
  StimFirebaseFirestore firestore, StimFirebaseFirestoreCollection parent, @required
  StimModelType model, @required
  StimModelField idField, Set<StimFirebaseFirestoreCollection> collections, StimFirebaseSecurityRule rule, @required
  StimRbacResource resource, Set<StimModelTag> tags}) {
    return StimFirebaseFirestoreCollection()
        ..name = StimName.of(name)
        ..firestore = firestore
        ..parent = parent
        ..model = model
        ..idField = idField
        ..collections = collections ?? {}
        ..rule = rule
        ..resource = resource
        ..tags = tags ?? {};
  }
}
