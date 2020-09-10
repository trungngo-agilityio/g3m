part of g3.stimpack.firebase.init;

extension StimFirebaseFirestoreCollectionExtension
    on StimFirebaseFirestoreCollectionScope {
  /// Creates a root firestore collection, with the specified [name].
  ///
  /// The [StimFirebaseFirestoreCollection.resource] is automatically
  /// created as a new firestore collection resource under the
  /// specified [firestore]'s resource. This resource's security policy
  /// is automatically created as well via [rule] definition.
  ///
  /// The [StimFirebaseFirestoreCollection.model], which provides the schema
  /// of a document in this collection, is automatically created with the
  /// specified [fields]. Even in the case that the [fields] is not specified
  /// than the model is still created and the fields can be filled in later.
  ///
  StimFirebaseFirestoreCollection rootCollectionOf({
    @required dynamic name,
    @required StimFirebaseFirestore firestore,
    @required StimModelPackage package,
    Set<StimModelField> fields,
    @required StimFirebaseSecurityRule rule,
    Set<StimModelTag> tags,
  }) {
    assert(firestore != null, 'firestore is required');
    assert(package != null, 'package is required');

    // automatically add the id field to the model.
    // This is the firestore requirements.
    final idField = stimpack.model.field.model.autoStringId;
    fields ??= {};
    fields.add(idField);

    final res = of(
      name: name,
      firestore: firestore,
      rule: rule,
      tags: tags,
      resource: null,
      idField: idField,
      model: stimpack.model.type.of(
        name: StimName.of(name),
        package: package,
        fields: fields,
      ),
    );

    // adds the collection to the parent firestore.
    _addCollectionResource('instance of', res, firestore.resource);
    res.firestore.collections += res;
    return res;
  }

  /// Creates a sub collection of an existing collection, with the specified
  /// [name].
  ///
  /// The [StimFirebaseFirestoreCollection.resource] is automatically
  /// created as a new firestore collection source under the specified
  /// [parent] collection's resource. The newly created resource shall
  /// have the security policy is defined by the specified security [rule].
  ///
  /// The [StimFirebaseFirestoreCollection.model], which provides the schema
  /// of a document in this collection, is automatically created with the
  /// specified [fields]. Even in the case that the [fields] is not specified
  /// than the model is still created and the fields can be filled in later.
  ///
  StimFirebaseFirestoreCollection subCollectionOf({
    @required dynamic name,
    @required StimFirebaseFirestoreCollection parent,
    @required StimModelPackage package,
    StimModelField idField,
    Set<StimModelField> fields,
    @required StimFirebaseSecurityRule rule,
    Set<StimModelTag> tags,
  }) {
    assert(name != null, 'name is required');
    assert(package != null, 'package is required');

    assert(parent != null, 'parent is required');
    assert(parent.resource != null, 'parent.resource is required');

    // automatically add the id field to the model.
    // This is the firestore requirements.
    final idField = stimpack.model.field.model.autoStringId;
    fields ??= {};
    fields.add(idField);

    final res = of(
      name: name,
      parent: parent,
      tags: tags,
      rule: rule,
      firestore: parent.firestore,
      resource: null,
      idField: idField,
      model: stimpack.model.type.of(
        name: StimName.of(name),
        package: package,
        fields: fields,
      ),
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
    name: StimName.refOf(parentResource) >> StimName.refOf(res),
    parent: parentResource,
  );
}
