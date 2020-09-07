part of g3.stimpack.rest.generated;



class StimRestCrudDeleteOneApi extends StimModelSymbol<StimRestCrudDeleteOneApi> {
  StimModelField idField;

  StimRbacPolicy policy;

  Set<StimModelField> response;

  StimRestCrudDeleteOneApi();


  StimRestCrudDeleteOneApi ref() {
    return StimRestCrudDeleteOneApiRef()..symbol = this;
  }

  /// Creates a new "crudDeleteOneApi" of [StimRestCrudDeleteOneApi] type.
  StimRestCrudDeleteOneApi refWith({dynamic name, StimModelField idField, StimRbacPolicy policy, Set<StimModelField> response, Set<StimModelTag> tags}) {
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


class StimRestCrudDeleteOneApiRef extends StimSymbolRef<StimRestCrudDeleteOneApi> implements StimRestCrudDeleteOneApi {

}


class StimRestCrudDeleteOneApiScope {
  /// Creates a new "crudDeleteOneApi" of [StimRestCrudDeleteOneApi] type.
  StimRestCrudDeleteOneApi of({dynamic name, StimModelField idField, StimRbacPolicy policy, Set<StimModelField> response, Set<StimModelTag> tags}) {
    return StimRestCrudDeleteOneApi()
        ..name = StimName.of(name)
        ..idField = idField
        ..policy = policy
        ..response = response ?? {}
        ..tags = tags ?? {};
  }
}
