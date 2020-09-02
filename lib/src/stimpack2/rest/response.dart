part of g3.stimpack2.rest;

class StimRestResponseScope {
  static StimRestResponse of({
    @required dynamic name,
    Set<StimModelTag> tags,
    StimModelType model,
    bool streamed,
  }) =>
      StimRestResponse()
        ..name = StimName.of(name)
        ..tags = tags
        ..model = model
        ..streamed = streamed;
}

class StimRestResponse extends StimModelSymbol<StimRestResponse> {
  /// The data model for the response object.
  StimModelType model;

  /// True indicates that the response should be streamed.
  bool streamed;

  StimRestResponseRef _ref;

  /// Gets the reference to this model.
  StimRestResponse get ref => _ref ??= StimRestResponseRef()..symbol = this;

  StimRestResponse();
}

class StimRestResponseRef extends StimSymbolRef<StimRestResponse>
    implements StimRestResponse {}
