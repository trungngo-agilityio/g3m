part of g3.stimpack.rest.init;

extension OnRestCrudApiScopeExtension on StimRestCrudApiScope {
  StimRestCrudApi forModel({
    @required dynamic name,

    // model level
    @required StimModelPackage package,
    @required StimModelType model,

    // model fields
    StimModelField idField,
    Set<StimModelField> fields,

    // create one
    dynamic createOneName,
    Set<StimModelField> createOneFields,
    // update one
    dynamic updateOneName,
    Set<StimModelField> updateOneFields,
    // find one
    dynamic findOneName,
    Set<StimModelField> findOneFields,
    // delete one
    dynamic deleteOneName,
    // find
    dynamic findName,
    Set<StimModelField> findFields,
    // delete
    dynamic deleteName,
    Set<StimModelField> deleteFields,
    Set<StimModelTag> tags,
  }) {
    assert(name != null, 'model is required');
    assert(model != null, 'model is required');

    fields ??= model.fields;
    assert(fields != null, 'model fields is required');

    package ??= model.package;

    // Default the crud api name to the model name.
    name = StimName.of(name ?? model);
    idField = _extractRequiredIdField(idField, fields);

    // Builds the create one api.
    createOneName ??= name << 'create one';
    createOneFields ??= fields;
    final createOne = _rest.crudCreateOneApi.forFieldSet(
      name: createOneName,
      package: package,
      fields: createOneFields,
      idField: idField,
    );

    // Builds the update one api.
    updateOneName ??= name << 'update one';
    updateOneFields ??= fields;
    final updateOne = _rest.crudUpdateOneApi.forFieldSet(
      name: updateOneName,
      package: package,
      fields: updateOneFields,
      idField: idField,
    );

    // Builds the find one api.
    findOneName ??= name << 'find one';
    findOneFields ??= fields;

    final findOne = _rest.crudFindOneApi.forFieldSet(
      name: findOneName,
      package: package,
      fields: findOneFields,
      idField: idField,
    );

    // Builds the delete one api
    deleteOneName ??= name << 'delete one';
    final deleteOne = _rest.crudDeleteOneApi.forIdField(
      name: deleteOneName,
      package: package,
      idField: idField,
    );

    findName ??= name << 'find';
    findFields ??= fields;

    final find = _rest.crudFindApi.forFieldSet(
      name: findName,
      package: package,
      fields: findFields,
      idField: idField,
    );

    deleteName ??= name << 'delete';
    deleteFields ??= fields;

    final delete = _rest.crudDeleteApi.forFieldSet(
      name: deleteName,
      package: package,
      fields: deleteFields,
      idField: idField,
    );

    final res = of(
      // the api name is default to the model name.
      name: name,
      model: model,
      idField: idField,
      createOne: createOne,
      findOne: findOne,
      updateOne: updateOne,
      deleteOne: deleteOne,
      find: find,
      delete: delete,
    );
    return res;
  }
}
