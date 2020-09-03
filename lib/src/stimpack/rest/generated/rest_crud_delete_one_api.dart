part of g3.stimpack.rest.generated;



class StimRestCrudDeleteOneApi extends StimModelSymbol<StimRestCrudDeleteOneApi> {
  StimRbacPolicy policy;

  StimModelField idField;

  Set<StimModelField> response;

  StimRestCrudDeleteOneApiRef _ref;

  StimRestCrudDeleteOneApiRef get ref {
    return _ref ??= StimRestCrudDeleteOneApiRef();
  }
  StimRestCrudDeleteOneApi();
}


class StimRestCrudDeleteOneApiRef extends StimSymbolRef<StimRestCrudDeleteOneApi> implements StimRestCrudDeleteOneApi {

}


class StimRestCrudDeleteOneApiScope {
  /// Creates a new "crudDeleteOneApi" of [StimRestCrudDeleteOneApi] type.
  StimRestCrudDeleteOneApi of({dynamic name, StimRbacPolicy policy, StimModelField idField, Set<StimModelField> response, Set<StimModelTag> tags}) {
    return StimRestCrudDeleteOneApi()
        ..name = StimName.of(name)
        ..policy = policy
        ..idField = idField
        ..response = response ?? {}
        ..tags = tags ?? {};
  }
}
