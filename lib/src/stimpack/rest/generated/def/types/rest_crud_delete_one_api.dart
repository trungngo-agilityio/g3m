part of g3.stimpack.rest.generated;



class StimRestCrudDeleteOneApi extends StimModelSymbol<StimRestCrudDeleteOneApi> {
  StimModelField idField;

  StimRestApi api;

  StimRestCrudDeleteOneApi();


  StimRestCrudDeleteOneApi ref() {
    return StimRestCrudDeleteOneApiRef()..symbol = this;
  }

  /// Creates a new "crudDeleteOneApi" of [StimRestCrudDeleteOneApi] type.
  StimRestCrudDeleteOneApi refWith({dynamic name, StimModelField idField, StimRestApi api, Set<StimModelTag> tags}) {
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


class StimRestCrudDeleteOneApiRef extends StimSymbolRef<StimRestCrudDeleteOneApi> implements StimRestCrudDeleteOneApi {

}


class StimRestCrudDeleteOneApiScope {
  /// Creates a new "crudDeleteOneApi" of [StimRestCrudDeleteOneApi] type.
  StimRestCrudDeleteOneApi of({@required
  dynamic name, @required
  StimModelField idField, @required
  StimRestApi api, Set<StimModelTag> tags}) {
    return StimRestCrudDeleteOneApi()
        ..name = StimName.of(name)
        ..idField = idField
        ..api = api
        ..tags = tags ?? {};
  }
}
