part of g3.stimpack.rest.generated;



class StimRestCrudDeleteOneApi extends StimModelSymbol<StimRestCrudDeleteOneApi> {
  StimModelField idField;

  StimRestApi api;

  StimRestCrudDeleteOneApi();


  /// Creates a new "crudDeleteOneApi" of [StimRestCrudDeleteOneApi] type.
  StimRestCrudDeleteOneApi copyWith({@required
  dynamic name, StimModelField idField, @required
  StimRestApi api, Set<StimModelTag> tags}) {
    return StimRestCrudDeleteOneApi()
        ..name = StimName.of(name ?? this.name)
        ..idField = idField ?? this.idField
        ..api = api ?? this.api
        ..tags = tags ?? this.tags;
  }
}


class StimRestCrudDeleteOneApiScope {
  /// Creates a new "crudDeleteOneApi" of [StimRestCrudDeleteOneApi] type.
  StimRestCrudDeleteOneApi of({@required
  dynamic name, StimModelField idField, @required
  StimRestApi api, Set<StimModelTag> tags}) {
    return StimRestCrudDeleteOneApi()
        ..name = StimName.of(name)
        ..idField = idField
        ..api = api
        ..tags = tags ?? {};
  }
}
