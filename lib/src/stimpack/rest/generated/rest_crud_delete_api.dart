part of g3.stimpack.rest.generated;



class StimRestCrudDeleteApi extends StimModelSymbol<StimRestCrudDeleteApi> {
  StimRestCrudDeleteApiRef _ref;

  StimRestCrudDeleteApiRef get ref {
    return _ref ??= StimRestCrudDeleteApiRef();
  }
  StimRestCrudDeleteApi();
}


class StimRestCrudDeleteApiRef extends StimSymbolRef<StimRestCrudDeleteApi> implements StimRestCrudDeleteApi {

}


class StimRestCrudDeleteApiScope {
  /// Creates a new "crudDeleteApi" of [StimRestCrudDeleteApi] type.
  StimRestCrudDeleteApi of({dynamic name, Set<StimModelTag> tags}) {
    return StimRestCrudDeleteApi()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
