part of g3.stimpack.firebase.init;

extension StimFirebaseFirestoreExtension on StimFirebaseFirestoreScope {
  /// Creates a new instance of firestore database.
  /// This also creates a new firestore instance resource under
  /// the firestore resource root.
  StimFirebaseFirestore instanceOf(
      {@required dynamic name, Set<StimModelTag> tags}) {
    /// Creates a new firestore resource under the firestore resource root.
    final r = stimpack.rbac.resource, fr = r.firebase;

    final res = of(
      name: name,
      tags: tags,
      resource: null,
    );

    res.resource = r.of(
      name: 'firestore://' >> StimName.refOf(res),
      parent: fr.firestoreService,
    );

    return res;
  }
}
