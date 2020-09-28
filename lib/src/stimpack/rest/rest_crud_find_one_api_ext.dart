part of g3.stimpack.rest.init;

extension ExtStimRestCrudFindOneApiScope on StimRestCrudFindOneApiScope {
  // TODO: Documentation
  StimRestCrudFindOneApi forModel({
    dynamic name,
    StimModelPackage package,
    StimModelField idField,
    @required StimModelType model,
    Set<StimModelTag> tags,
  }) {
    assert(model != null, 'model is required');
    package ??= model.package;

    assert(model.fields != null, 'model field is required');
    final idField = _extractRequiredIdField(null, model.fields);

    name ??= StimName.of('find one');
    final requestName = name >> model.name >> 'request';
    final responseName = name >> model.name >> 'response';

    return forFieldSet(
      name: name,
      package: package,
      idField: idField,
      fields: model.fields,
      requestName: requestName,
      responseName: responseName,
      tags: tags,
    );
  }

  // TODO: Documentation
  StimRestCrudFindOneApi forFieldSet({
    @required dynamic name,
    @required StimModelPackage package,
    StimModelField idField,
    @required Set<StimModelField> fields,
    dynamic requestName,
    dynamic responseName,
    Set<StimModelTag> tags,
  }) {
    assert(name != null, 'name is required');
    assert(package != null, 'package is required');
    assert(fields != null, 'model fields is required');

    idField = _extractRequiredIdField(idField, fields);

    final response = <StimModelField>{};
    for (final field in fields) {
      if (field.isSystemOnly || field.isTransient) continue;
      if (!field.isWriteOnly) response.add(field);
    }

    return of(
      name: name,
      tags: tags,
      idField: idField,
      api: _rest.api.forFieldSet(
        name: name,
        package: package,
        requestName: requestName,
        request: {idField},
        responseName: responseName,
        response: response,
      ),
    );
  }
}
