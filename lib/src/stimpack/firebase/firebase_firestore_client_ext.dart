part of g3.stimpack.firebase.init;

extension OnRestCrudApiExtension on StimRestCrudApiScope {

  /// Givens a firestore collection, this function helps
  /// to create a new set of crud apis for the specified api [client].
  /// The newly created crud api is also added into the
  /// [StimFirebaseFirestoreClient.crudApis] collection.
  ///
  /// The [StimFirebaseFirestoreClient.model] field of the [collection]
  /// will be used to figure out the set of request and response fields
  /// for all crud apis.
  ///
  /// See [StimRestCrudApiScope.forModel] api for more documentation on
  /// how the crud api can be created.
  ///
  StimRestCrudApi forFirestoreCollection({
    @required StimFirebaseFirestoreClient client,
    @required StimFirebaseFirestoreCollection collection,
    StimModelPackage package,
  }) {
    assert(client != null, 'client is required');

    assert(collection != null, 'collection is required');
    assert(collection.model != null, 'collection.model is required');

    assert(!client.collections.contains(collection),
        'client must not have the collection');

    // Creates the crud api for the model.
    final res = stimpack.rest.crudApi.forModel(
      // the crud api name shall refers to the collection name
      name: StimName.refOf(collection) >> 'api',

      package: package,
      // This is the field in the model definition that can be used.
      // notes that we don't pass in the id field. Assumes
      // that the model must have a valid field named 'id'.
      // We need that to identify the document id anyway.
      model: collection.model,
      idField: collection.idField,
    );

    client.collections += collection;
    client.crudApis += res;

    return res;
  }
}
