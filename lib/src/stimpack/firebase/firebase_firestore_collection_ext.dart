part of g3.stimpack.firebase.init;

extension StimFirebaseFirestoreCollectionExtension
    on StimFirebaseFirestoreCollectionScope {
  /// Creates a root firestore collection.
  StimFirebaseFirestoreCollection rootCollectionOf({
    @required dynamic name,
    @required StimFirebaseFirestore firestore,
    StimFirebaseSecurityRule rule,
    Set<StimModelTag> tags,
  }) {
    assert(firestore != null, 'firestore is required');

    final res = of(
      name: name,
      firestore: firestore,
      rule: rule,
      tags: tags,
      resource: null,
    );

    // adds the collection to the parent firestore.
    _addCollectionResource('instance of', res, firestore.resource);
    res.firestore.collections += res;
    return res;
  }

  /// Creates a sub collection of an existing collection.
  StimFirebaseFirestoreCollection subCollectionOf({
    @required dynamic name,
    @required StimFirebaseFirestoreCollection parent,
    StimFirebaseSecurityRule rule,
    Set<StimModelTag> tags,
  }) {
    assert(parent != null, 'parent is required');
    assert(parent.resource != null, 'parent.resource is required');

    final res = of(
      name: name,
      parent: parent,
      tags: tags,
      rule: rule,
      firestore: parent.firestore,
      resource: null,
    );

    _addCollectionResource('collection of', res, parent.resource);

    parent.collections += res;
    return res;
  }
}

void _addCollectionResource(
  String text,
  StimFirebaseFirestoreCollection res,
  StimRbacResource parentResource,
) {
  // Makes a resource for this collection.
  final r = stimpack.rbac.resource;
  res.resource = r.of(
    name: StimName.refOf(res) >> text >> StimName.refOf(parentResource),
    parent: parentResource,
  );
}
