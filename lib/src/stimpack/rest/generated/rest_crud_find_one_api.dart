part of g3.stimpack.rest.generated;



class StimRestCrudFindOneApi extends StimModelSymbol<StimRestCrudFindOneApi> {
  StimRbacPolicy policy;

  StimModelField idField;

  Set<StimModelField> response;

  StimRestCrudFindOneApiRef _ref;

  StimRestCrudFindOneApiRef get ref {
    return _ref ??= StimRestCrudFindOneApiRef();
  }
  StimRestCrudFindOneApi();
}


class StimRestCrudFindOneApiRef extends StimSymbolRef<StimRestCrudFindOneApi> implements StimRestCrudFindOneApi {

}


class StimRestCrudFindOneApiScope {
  /// Creates a new "crudFindOneApi" of [StimRestCrudFindOneApi] type.
  StimRestCrudFindOneApi of({dynamic name, StimRbacPolicy policy, StimModelField idField, Set<StimModelField> response, Set<StimModelTag> tags}) {
    return StimRestCrudFindOneApi()
        ..name = StimName.of(name)
        ..policy = policy
        ..idField = idField
        ..response = response ?? {}
        ..tags = tags ?? {};
  }
}
