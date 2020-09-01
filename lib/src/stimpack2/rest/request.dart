part of g3.stimpack2.rest;

class StimRestRequestScope {
  static StimRestRequest of({
    dynamic name,
    Set<StimModelTag> tags,
    StimModelType model,
    bool streamed,
  }) =>
      StimRestRequest()
        ..name = StimName.of(name)
        ..tags = tags
        ..model = model
        ..streamed = streamed;
}

class StimRestRequest extends StimModelSymbol<StimRestRequest> {
  /// The data model for the request object.
  StimModelType model;

  /// True indicates that the request is streamed instead of one time
  bool streamed;

  StimRestRequest();
}