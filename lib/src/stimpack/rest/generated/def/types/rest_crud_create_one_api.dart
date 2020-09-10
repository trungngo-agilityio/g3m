part of g3.stimpack.rest.generated;



class StimRestCrudCreateOneApi extends StimModelSymbol<StimRestCrudCreateOneApi> {
  StimModelField idField;

  StimRestApi api;

  StimRestCrudCreateOneApi();


  StimRestCrudCreateOneApi ref() {
    return StimRestCrudCreateOneApiRef()..symbol = this;
  }

  /// Creates a new "crudCreateOneApi" of [StimRestCrudCreateOneApi] type.
  StimRestCrudCreateOneApi refWith({dynamic name, StimModelField idField, StimRestApi api, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (idField != null) {
      res.idField = idField;
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


class StimRestCrudCreateOneApiRef extends StimSymbolRef<StimRestCrudCreateOneApi> implements StimRestCrudCreateOneApi {

}


class StimRestCrudCreateOneApiScope {
  /// Creates a new "crudCreateOneApi" of [StimRestCrudCreateOneApi] type.
  StimRestCrudCreateOneApi of({@required
  dynamic name, @required
  StimModelField idField, @required
  StimRestApi api, Set<StimModelTag> tags}) {
    return StimRestCrudCreateOneApi()
        ..name = StimName.of(name)
        ..idField = idField
        ..api = api
        ..tags = tags ?? {};
  }
}
