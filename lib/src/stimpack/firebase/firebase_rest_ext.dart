part of g3.stimpack.firebase.init;

extension StimFirebaseOnRestCrudApi on StimRestCrudApiScope {
  StimRestCrudApi ofFirebaseCollection({
    @required StimFirebaseFirestoreCollection collection,
    Set<StimModelTag> tags,
  }) {
    assert(collection != null, 'collection is required');
    assert(collection.name?.isNotEmpty == true, 'collection name is required');
    assert(collection.model != null, 'collection model is required');
    final name = StimName.refOf(collection);

    // Gets out the id field for the model field set.
    final idField = collection.model?.fields?.firstWhereNameIs('id');
    assert(idField != null, 'id field is required');

    // Builds the crud collection
    final res = of(
      name: name,
      tags: tags,
      model: collection.model,
      idField: idField,
      createOne: stimpack.rest.crudCreateOneApi.of(
        name: 'create one',
        idField: idField,
      ),
    );
    return res;
  }
}
