part of g3.stimpack.rest.generated;



class StimRestCrudCreateOneApi extends StimModelSymbol<StimRestCrudCreateOneApi> {
  StimRbacPolicy policy;

  StimModelField idField;

  Set<StimModelField> response;

  StimRestCrudCreateOneApiRef _ref;

  StimRestCrudCreateOneApiRef get ref {
    return _ref ??= StimRestCrudCreateOneApiRef();
  }
  StimRestCrudCreateOneApi();
}


class StimRestCrudCreateOneApiRef extends StimSymbolRef<StimRestCrudCreateOneApi> implements StimRestCrudCreateOneApi {

}


class StimRestCrudCreateOneApiScope {
  /// Creates a new "crudCreateOneApi" of [StimRestCrudCreateOneApi] type.
  StimRestCrudCreateOneApi of({dynamic name, StimRbacPolicy policy, StimModelField idField, Set<StimModelField> response, Set<StimModelTag> tags}) {
    return StimRestCrudCreateOneApi()
        ..name = StimName.of(name)
        ..policy = policy
        ..idField = idField
        ..response = response ?? {}
        ..tags = tags ?? {};
  }
}
