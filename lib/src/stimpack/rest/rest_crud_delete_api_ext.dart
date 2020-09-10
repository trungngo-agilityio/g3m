part of g3.stimpack.rest.init;

extension ExtStimRestCrudDeleteApiScope on StimRestCrudDeleteApiScope {
  /// TODO: Documentation
  StimRestCrudDeleteApi forModel({
    dynamic name,
    StimModelPackage package,
    StimModelField idField,
    @required StimModelType model,
    Set<StimModelTag> tags,
  }) {
    assert(model != null, 'model is required');
    package ??= model.package;

    // default the api name to the model name.
    name ??= StimName.of(name ?? model) << 'delete';

    return forFieldSet(
      name: name,
      package: package,
      idField: idField,
      fields: model.fields,
      tags: tags,
    );
  }

  /// TODO: Documentation
  StimRestCrudDeleteApi forFieldSet({
    @required dynamic name,
    @required StimModelPackage package,
    @required StimModelField idField,
    @required Set<StimModelField> fields,
    Set<StimModelTag> tags,
  }) {
    assert(name != null, 'name is required');
    assert(package != null, 'package is required');
    assert(fields != null, 'model fields is required');

    final _idField = _extractRequiredIdField(idField, fields);

    final request = <StimModelField>{};

    final response = <StimModelField>{};

    for (final field in fields) {
      // Ignore certain fields
      if (field.isSystemOnly || field.isTransient) continue;

      if (field == _idField || field.isIndexed) {
        // Just add the id field by default. It is weird if any technology
        // don't auto indexed that field.
        request.add(field);
      }

      if (!field.isWriteOnly) response.add(field);
    }

    return of(
      name: name,
      api: stimpack.rest.api.forFieldSet(
        name: name,
        package: package,
        request: request,
        response: response,
      ),
      tags: tags,
    );
  }
}


