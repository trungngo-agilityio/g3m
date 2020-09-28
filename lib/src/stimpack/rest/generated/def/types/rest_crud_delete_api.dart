part of g3.stimpack.rest.generated;



class StimRestCrudDeleteApi extends StimModelSymbol<StimRestCrudDeleteApi> {
  StimRestApi api;

  StimRestCrudDeleteApi();


  /// Creates a new "crudDeleteApi" of [StimRestCrudDeleteApi] type.
  StimRestCrudDeleteApi copyWith({@required
  dynamic name, @required
  StimRestApi api, Set<StimModelTag> tags}) {
    return StimRestCrudDeleteApi()
        ..name = StimName.of(name ?? this.name)
        ..api = api ?? this.api
        ..tags = tags ?? this.tags;
  }
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
