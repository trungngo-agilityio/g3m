part of g3.stimpack2.rest;

class StimRestCrudCreateOneApiScope {
  StimRestCrudCreateOneApi of({
    @required dynamic name,
    Set<StimModelTag> tags,
  }) =>
      StimRestCrudCreateOneApi()
        ..name = StimName.of(name)
        ..tags = tags;
}

/// This class models a POST restful API to create a record, given
/// the [requestFields] and associated validation rules.
///
class StimRestCrudCreateOneApi
    extends StimModelSymbol<StimRestCrudCreateOneApi> {
  /// The fields & associated validation rules for the request body.
  Set<StimModelField> requestFields;

  /// The field that shall be return in the case that
  /// create api success.
  Set<StimModelField> responseFields;

  StimRestCrudCreateOneApiRef _ref;

  /// Gets the reference to this model.
  StimRestCrudCreateOneApi get ref =>
      _ref ??= StimRestCrudCreateOneApiRef()..symbol = this;

  StimRestCrudCreateOneApi();
}

class StimRestCrudCreateOneApiRef
    extends StimSymbolRef<StimRestCrudCreateOneApi>
    implements StimRestCrudCreateOneApi {}
