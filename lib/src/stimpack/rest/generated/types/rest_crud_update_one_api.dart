part of g3.stimpack.rest.generated;

class StimRestCrudUpdateOneApi
    extends StimModelSymbol<StimRestCrudUpdateOneApi> {
  StimModelField idField;

  StimRbacPolicy policy;

  Set<StimModelField> response;

  StimRestCrudUpdateOneApi();

  StimRestCrudUpdateOneApi ref() {
    return StimRestCrudUpdateOneApiRef()..symbol = this;
  }

  /// Creates a new "crudUpdateOneApi" of [StimRestCrudUpdateOneApi] type.
  StimRestCrudUpdateOneApi refWith(
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

class StimRestCrudUpdateOneApiRef
    extends StimSymbolRef<StimRestCrudUpdateOneApi>
    implements StimRestCrudUpdateOneApi {}

class StimRestCrudUpdateOneApiScope {
  /// Creates a new "crudUpdateOneApi" of [StimRestCrudUpdateOneApi] type.
  StimRestCrudUpdateOneApi of(
      {dynamic name,
      StimModelField idField,
      StimRbacPolicy policy,
      Set<StimModelField> response,
      Set<StimModelTag> tags}) {
    return StimRestCrudUpdateOneApi()
      ..name = StimName.of(name)
      ..idField = idField
      ..policy = policy
      ..response = response ?? {}
      ..tags = tags ?? {};
  }
}
