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
    dynamic createOneRequestName,
    dynamic createOneResponseName,
    Set<StimModelField> createOneFields,
    // update one
    dynamic updateOneName,
    dynamic updateOneRequestName,
    dynamic updateOneResponseName,
    Set<StimModelField> updateOneFields,
    // find one
    dynamic findOneName,
    dynamic findOneRequestName,
    dynamic findOneResponseName,
    Set<StimModelField> findOneFields,
    // delete one
    dynamic deleteOneName,
    // find
    dynamic findName,
    dynamic findRequestName,
    dynamic findResponseName,
    Set<StimModelField> findFields,
    // delete
    dynamic deleteName,
    dynamic deleteRequestName,
    dynamic deleteResponseName,
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

    // -------------------------------------------------------------------------
    // Create one

    createOneName ??= StimName.of('create one');
    createOneRequestName ??= createOneName >> model.name >> 'request';
    createOneResponseName ??= createOneName >> model.name >> 'response';
    createOneFields ??= fields;

    final createOne = _rest.crudCreateOneApi.forFieldSet(
      name: createOneName,
      package: package,
      fields: createOneFields,
      idField: idField,
      requestName: createOneRequestName,
      responseName: createOneResponseName,
    );

    // -------------------------------------------------------------------------
    // Update ond
    updateOneName ??= StimName.of('update one');
    updateOneRequestName ??= updateOneName >> model.name >> 'request';
    updateOneResponseName ??= updateOneName >> model.name >> 'response';
    updateOneFields ??= fields;

    final updateOne = _rest.crudUpdateOneApi.forFieldSet(
      name: updateOneName,
      package: package,
      fields: updateOneFields,
      idField: idField,
      requestName: updateOneRequestName,
      responseName: updateOneResponseName,
    );

    // -------------------------------------------------------------------------
    // Find one

    findOneName ??= StimName.of('find one');
    findOneRequestName ??= findOneName >> model.name >> 'request';
    findOneResponseName ??= findOneName >> model.name >> 'response';
    findOneFields ??= fields;

    final findOne = _rest.crudFindOneApi.forFieldSet(
      name: findOneName,
      package: package,
      fields: findOneFields,
      idField: idField,
      requestName: findOneResponseName,
      responseName: findOneResponseName,
    );

    // -------------------------------------------------------------------------
    // Delete One
    deleteOneName ??= StimName.of('delete one');
    final deleteOne = _rest.crudDeleteOneApi.forIdField(
      name: deleteOneName,
      package: package,
      idField: idField,
    );

    // -------------------------------------------------------------------------
    // Find
    findName ??= StimName.of('find');
    findRequestName ??= findName >> model.name >> 'request';
    findResponseName ??= findName >> model.name >> 'response';
    findFields ??= fields;

    final find = _rest.crudFindApi.forFieldSet(
      name: findName,
      package: package,
      fields: findFields,
      idField: idField,
      requestName: findRequestName,
      responseName: findResponseName,
    );

    // -------------------------------------------------------------------------
    // Delete
    deleteName ??= StimName.of('delete');
    deleteRequestName ??= deleteName >> model.name >> 'request';
    deleteResponseName ??= deleteName >> model.name >> 'response';
    deleteFields ??= fields;

    final delete = _rest.crudDeleteApi.forFieldSet(
      name: deleteName,
      package: package,
      fields: deleteFields,
      idField: idField,
      requestName: deleteRequestName,
      responseName: deleteResponseName,
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
