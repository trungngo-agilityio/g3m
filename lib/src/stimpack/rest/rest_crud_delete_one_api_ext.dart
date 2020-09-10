part of g3.stimpack.rest.init;

extension ExtStimRestCrudDeleteOneApiScope on StimRestCrudDeleteOneApiScope {
  // TODO: Documentation
  StimRestCrudDeleteOneApi forModel({
    dynamic name,
    StimModelPackage package,
    @required StimModelType model,
    Set<StimModelTag> tags,
  }) {
    assert(model != null, 'model is required');
    package ??= model.package;

    assert(model.fields != null, 'model field is required');
    final idField = _extractRequiredIdField(null, model.fields);

    name ??= StimName.of(name ?? model) << 'delete one';

    return forIdField(
      name: name,
      package: package,
      idField: idField,
      tags: tags,
    );
  }

  // TODO: Documentation
  StimRestCrudDeleteOneApi forIdField({
    @required dynamic name,
    @required StimModelPackage package,
    @required StimModelField idField,
    Set<StimModelTag> tags,
  }) {
    assert(name != null, 'name is required');
    assert(idField != null, 'idField is required');
    assert(package != null, 'package is required');

    return of(
      name: name,
      tags: tags,
      idField: idField,
      api: _rest.api.forFieldSet(
        name: name,
        package: package,
        request: {idField},
        response: null,
      ),
    );
  }
}
