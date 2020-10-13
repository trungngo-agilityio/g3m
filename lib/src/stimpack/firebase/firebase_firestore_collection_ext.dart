part of g3.stimpack.firebase.init;

extension OnStimFirebaseFirestoreCollectionExtension
on StimFirebaseFirestoreCollection {
  void childOf(StimFirebaseFirestoreCollection target) {
    assert(target != null, 'target is required');
    assert(parent == null, 'parent must not be set');
    assert(!target.collections.contains(this),
    'target must not contains the current collection');
    parent = target;
    target.collections.add(this);
  }

  StimModelField partOf(StimFirebaseFirestoreCollection target, {
    dynamic name,
    String comment,
  }) {
    idField.name = name ?? StimName.of(target) >> 'id';
    if (comment != null) idField.comment = comment;
    return idField;
  }

  /// For all target collection, has the id field is the src id field.
  StimModelField hasOne(StimFirebaseFirestoreCollection target, {
    dynamic name,
    Set<StimModelFieldRule> rules,
    Set<StimModelFilter> filters,
    String comment,
    Set<StimModelTag> tags,
  }) {
    final field = stimpack.model.field.of(
      name: name ?? StimName.refOf(target) >> 'id',
      type: target.idField.type,
      tags: tags,
      rules: rules,
      filters: filters,
      comment: comment,
    );

    model.fields += field;
    return field;
  }

  StimModelField hasOneEmbedded(StimModelType target, {
    dynamic name,
    Set<StimModelFieldRule> rules,
    Set<StimModelFilter> filters,
    String comment,
    Set<StimModelTag> tags,
  }) {
    final field = stimpack.model.field.of(
      name: name ?? StimName.of(target),
      type: target,
      rules: rules,
      filters: filters,
      comment: comment,
      tags: tags,
    );

    model.fields += field;
    return field;
  }

  /// For all target collections, add a foreign key field that link to
  /// the source collection.
  StimModelField hasMany(StimFirebaseFirestoreCollection target, {
    dynamic name,
    Set<StimModelFieldRule> rules,
    Set<StimModelFilter> filters,
    String comment,
    Set<StimModelTag> tags,
  }) {
    final field = stimpack.model.field.setOf(
      name: name ?? StimName.of(target) >> 'ids',
      type: target.idField.type,
      rules: rules,
      filters: filters,
      comment: comment,
      tags: tags,
    );

    model.fields += field;
    return field;
  }

  StimModelField hasManyEmbedded(StimModelType target, {
    dynamic name,
    Set<StimModelFieldRule> rules,
    Set<StimModelFilter> filters,
    String comment,
    Set<StimModelTag> tags,
  }) {
    final field = stimpack.model.field.listOf(
      name: name ?? StimName.of(target) >> 'list',
      type: target,
      rules: rules,
      filters: filters,
      comment: comment,
      tags: tags,
    );

    model.fields += field;
    return field;
  }
}

extension OnStimFirebaseFirestoreCollectionScopeExtension
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
    final idField = stimpack.model.field.model.stringId.copyWith();
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
        name: null,
        package: package,
        fields: fields,
      ),
    );

    /// Makes model name is always collection names
    res.model.name = StimName.refOf(res);

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
        name: null,
        package: package,
        fields: fields,
      ),
    );

    res.model.name = StimName.refOf(res);

    _addCollectionResource('collection of', res, parent.resource);

    parent.collections += res;
    return res;
  }
}

void _addCollectionResource(String text,
    StimFirebaseFirestoreCollection res,
    StimRbacResource parentResource,) {
  // Makes a resource for this collection.
  final r = stimpack.rbac.resource;
  res.resource = r.of(
    name: StimName.refOf(parentResource) >> StimName.refOf(res),
    parent: parentResource,
  );
}
