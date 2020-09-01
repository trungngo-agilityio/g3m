part of g3.stimpack2.rest;

class StimRestCrudApiScope {
  static StimRestCrudApi of({
    dynamic name,
    Set<StimModelTag> tags,
    StimRestApi createOne,
    StimRestApi updateOne,
    StimRestApi findOne,
    StimRestApi find,
    StimRestApi deleteOne,
    StimRestApi delete,
  }) {
    return StimRestCrudApi()
      ..name = StimName.of(name)
      ..tags = tags
      ..createOne = createOne
      ..updateOne = updateOne
      ..findOne = findOne
      ..find = find
      ..deleteOne = deleteOne
      ..delete = delete;
  }

  static StimRestCrudApi ofModel({
    dynamic name,
    Set<StimModelTag> tags,
    StimModelType model,
  }) {}
}

class StimRestCrudApi extends StimModelSymbol<StimRestCrudApi> {
  /// Creates one record apis
  StimRestApi createOne;

  /// Updates one record api
  StimRestApi updateOne;

  /// Find one record api
  StimRestApi findOne;

  /// Find multiple records api
  StimRestApi find;

  /// Delete one record api.
  StimRestApi deleteOne;

  /// Delete multiple records api.
  StimRestApi delete;

  StimRestCrudApi();
}
