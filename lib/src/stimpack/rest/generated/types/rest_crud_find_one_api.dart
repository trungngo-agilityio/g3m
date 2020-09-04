part of g3.stimpack.rest.generated;



class StimRestCrudFindOneApi extends StimModelSymbol<StimRestCrudFindOneApi> {
  StimModelField idField;

  StimRbacPolicy policy;

  Set<StimModelField> response;

  StimRestCrudFindOneApi();


  StimRestCrudFindOneApi ref() {
    return StimRestCrudFindOneApiRef()..symbol = this;
  }

  /// Creates a new "crudFindOneApi" of [StimRestCrudFindOneApi] type.
  StimRestCrudFindOneApi refWith({dynamic name, StimModelField idField, StimRbacPolicy policy, Set<StimModelField> response, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (idField != null) {
      res.idField = idField;
    }
    if (policy != null) {
      res.policy = policy;
    }
    if (response != null) {
      res.response = response;
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
  StimRestCrudFindOneApi of({dynamic name, StimModelField idField, StimRbacPolicy policy, Set<StimModelField> response, Set<StimModelTag> tags}) {
    return StimRestCrudFindOneApi()
        ..name = StimName.of(name)
        ..idField = idField
        ..policy = policy
        ..response = response ?? {}
        ..tags = tags ?? {};
  }
}
