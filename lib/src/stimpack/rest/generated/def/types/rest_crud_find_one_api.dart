part of g3.stimpack.rest.generated;



class StimRestCrudFindOneApi extends StimModelSymbol<StimRestCrudFindOneApi> {
  StimModelField idField;

  StimRestApi api;

  StimRestCrudFindOneApi();


  StimRestCrudFindOneApi ref() {
    return StimRestCrudFindOneApiRef()..symbol = this;
  }

  /// Creates a new "crudFindOneApi" of [StimRestCrudFindOneApi] type.
  StimRestCrudFindOneApi refWith({dynamic name, StimModelField idField, StimRestApi api, Set<StimModelTag> tags}) {
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


class StimRestCrudFindOneApiRef extends StimSymbolRef<StimRestCrudFindOneApi> implements StimRestCrudFindOneApi {

}


class StimRestCrudFindOneApiScope {
  /// Creates a new "crudFindOneApi" of [StimRestCrudFindOneApi] type.
  StimRestCrudFindOneApi of({@required
  dynamic name, @required
  StimModelField idField, @required
  StimRestApi api, Set<StimModelTag> tags}) {
    return StimRestCrudFindOneApi()
        ..name = StimName.of(name)
        ..idField = idField
        ..api = api
        ..tags = tags ?? {};
  }
}
