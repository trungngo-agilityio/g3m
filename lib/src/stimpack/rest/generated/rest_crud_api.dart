part of g3.stimpack.rest.generated;



class StimRestCrudApi extends StimModelSymbol<StimRestCrudApi> {
  StimModelType model;

  StimRestCrudCreateOneApi createOne;

  StimRestCrudUpdateOneApi updateOne;

  StimRestCrudFindOneApi findOne;

  StimRestCrudDeleteOneApi deleteOne;

  StimRestCrudFindApi find;

  StimRestCrudDeleteApi delete;

  StimRestCrudApiRef _ref;

  StimRestCrudApiRef get ref {
    return _ref ??= StimRestCrudApiRef();
  }
  StimRestCrudApi();
}


class StimRestCrudApiRef extends StimSymbolRef<StimRestCrudApi> implements StimRestCrudApi {

}


class StimRestCrudApiScope {
  /// Creates a new "crudApi" of [StimRestCrudApi] type.
  StimRestCrudApi of({dynamic name, StimModelType model, StimRestCrudCreateOneApi createOne, StimRestCrudUpdateOneApi updateOne, StimRestCrudFindOneApi findOne, StimRestCrudDeleteOneApi deleteOne, StimRestCrudFindApi find, StimRestCrudDeleteApi delete, Set<StimModelTag> tags}) {
    return StimRestCrudApi()
        ..name = StimName.of(name)
        ..model = model
        ..createOne = createOne
        ..updateOne = updateOne
        ..findOne = findOne
        ..deleteOne = deleteOne
        ..find = find
        ..delete = delete
        ..tags = tags ?? {};
  }
}
