part of g3.stimpack.rest.generated;

class StimRestCrudCreateOneApi
    extends StimModelSymbol<StimRestCrudCreateOneApi> {
  StimModelField idField;

  StimRbacPolicy policy;

  Set<StimModelField> response;

  StimRestCrudCreateOneApi();

  StimRestCrudCreateOneApi ref() {
    return StimRestCrudCreateOneApiRef()..symbol = this;
  }

  /// Creates a new "crudCreateOneApi" of [StimRestCrudCreateOneApi] type.
  StimRestCrudCreateOneApi refWith(
      {dynamic name,
      StimModelField idField,
      StimRbacPolicy policy,
      Set<StimModelField> response,
      Set<StimModelTag> tags}) {
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

class StimRestCrudCreateOneApiRef
    extends StimSymbolRef<StimRestCrudCreateOneApi>
    implements StimRestCrudCreateOneApi {}

class StimRestCrudCreateOneApiScope {
  /// Creates a new "crudCreateOneApi" of [StimRestCrudCreateOneApi] type.
  StimRestCrudCreateOneApi of(
      {dynamic name,
      StimModelField idField,
      StimRbacPolicy policy,
      Set<StimModelField> response,
      Set<StimModelTag> tags}) {
    return StimRestCrudCreateOneApi()
      ..name = StimName.of(name)
      ..idField = idField
      ..policy = policy
      ..response = response ?? {}
      ..tags = tags ?? {};
  }
}
