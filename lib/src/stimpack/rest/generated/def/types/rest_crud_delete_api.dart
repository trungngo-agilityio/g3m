part of g3.stimpack.rest.generated;



class StimRestCrudDeleteApi extends StimModelSymbol<StimRestCrudDeleteApi> {
  StimRestApi api;

  StimRestCrudDeleteApi();


  StimRestCrudDeleteApi ref() {
    return StimRestCrudDeleteApiRef()..symbol = this;
  }

  /// Creates a new "crudDeleteApi" of [StimRestCrudDeleteApi] type.
  StimRestCrudDeleteApi refWith({dynamic name, StimRestApi api, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (api != null) {
      res.api = api;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimRestCrudDeleteApiRef extends StimSymbolRef<StimRestCrudDeleteApi> implements StimRestCrudDeleteApi {

}


class StimRestCrudDeleteApiScope {
  /// Creates a new "crudDeleteApi" of [StimRestCrudDeleteApi] type.
  StimRestCrudDeleteApi of({@required
  dynamic name, @required
  StimRestApi api, Set<StimModelTag> tags}) {
    return StimRestCrudDeleteApi()
        ..name = StimName.of(name)
        ..api = api
        ..tags = tags ?? {};
  }
}
