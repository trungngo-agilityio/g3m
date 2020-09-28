part of g3.stimpack.rest.generated;



class StimRestCrudFindOneApi extends StimModelSymbol<StimRestCrudFindOneApi> {
  StimModelField idField;

  StimRestApi api;

  StimRestCrudFindOneApi();


  /// Creates a new "crudFindOneApi" of [StimRestCrudFindOneApi] type.
  StimRestCrudFindOneApi copyWith({@required
  dynamic name, StimModelField idField, @required
  StimRestApi api, Set<StimModelTag> tags}) {
    return StimRestCrudFindOneApi()
        ..name = StimName.of(name ?? this.name)
        ..idField = idField ?? this.idField
        ..api = api ?? this.api
        ..tags = tags ?? this.tags;
  }
}


class StimRestCrudFindOneApiScope {
  /// Creates a new "crudFindOneApi" of [StimRestCrudFindOneApi] type.
  StimRestCrudFindOneApi of({@required
  dynamic name, StimModelField idField, @required
  StimRestApi api, Set<StimModelTag> tags}) {
    return StimRestCrudFindOneApi()
        ..name = StimName.of(name)
        ..idField = idField
        ..api = api
        ..tags = tags ?? {};
  }
}
