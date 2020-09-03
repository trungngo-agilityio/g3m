part of g3.stimpack.rest.generated;



class StimRestCrudUpdateOneApi extends StimModelSymbol<StimRestCrudUpdateOneApi> {
  StimRbacPolicy policy;

  StimModelField idField;

  Set<StimModelField> response;

  StimRestCrudUpdateOneApiRef _ref;

  StimRestCrudUpdateOneApiRef get ref {
    return _ref ??= StimRestCrudUpdateOneApiRef();
  }
  StimRestCrudUpdateOneApi();
}


class StimRestCrudUpdateOneApiRef extends StimSymbolRef<StimRestCrudUpdateOneApi> implements StimRestCrudUpdateOneApi {

}


class StimRestCrudUpdateOneApiScope {
  /// Creates a new "crudUpdateOneApi" of [StimRestCrudUpdateOneApi] type.
  StimRestCrudUpdateOneApi of({dynamic name, StimRbacPolicy policy, StimModelField idField, Set<StimModelField> response, Set<StimModelTag> tags}) {
    return StimRestCrudUpdateOneApi()
        ..name = StimName.of(name)
        ..policy = policy
        ..idField = idField
        ..response = response ?? {}
        ..tags = tags ?? {};
  }
}
