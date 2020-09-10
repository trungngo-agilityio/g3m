part of g3.stimpack.rest.generated;



class StimRestCrudUpdateOneApi extends StimModelSymbol<StimRestCrudUpdateOneApi> {
  StimModelField idField;

  StimRestApi api;

  StimRestCrudUpdateOneApi();


  StimRestCrudUpdateOneApi ref() {
    return StimRestCrudUpdateOneApiRef()..symbol = this;
  }

  /// Creates a new "crudUpdateOneApi" of [StimRestCrudUpdateOneApi] type.
  StimRestCrudUpdateOneApi refWith({dynamic name, StimModelField idField, StimRestApi api, Set<StimModelTag> tags}) {
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


class StimRestCrudUpdateOneApiRef extends StimSymbolRef<StimRestCrudUpdateOneApi> implements StimRestCrudUpdateOneApi {

}


class StimRestCrudUpdateOneApiScope {
  /// Creates a new "crudUpdateOneApi" of [StimRestCrudUpdateOneApi] type.
  StimRestCrudUpdateOneApi of({@required
  dynamic name, @required
  StimModelField idField, @required
  StimRestApi api, Set<StimModelTag> tags}) {
    return StimRestCrudUpdateOneApi()
        ..name = StimName.of(name)
        ..idField = idField
        ..api = api
        ..tags = tags ?? {};
  }
}
