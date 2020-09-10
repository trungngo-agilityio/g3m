part of g3.stimpack.rest.init;

extension OnRestApiResponseScopeExt on StimRestApiResponseScope {
  // TODO: Documentation
  StimRestApiResponse forFieldSet({
    @required dynamic name,
    bool streamed,
    @required StimModelPackage package,
    @required Set<StimModelField> fields,
    Set<StimModelTag> tags,
  }) {
    assert(name != null, 'name is required');
    assert(package != null, 'package is required');

    // default the field set to empty.
    fields ??= {};

    // Creates a new model for the field set.
    final model = stimpack.model.type.of(
      name: name,
      package: package,
      fields: fields,
    );

    return of(
      name: name,
      tags: tags,
      streamed: streamed,
      model: model,
    );
  }
}
