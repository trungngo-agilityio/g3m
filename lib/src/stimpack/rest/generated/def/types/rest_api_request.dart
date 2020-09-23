part of g3.stimpack.rest.generated;



class StimRestApiRequest extends StimModelSymbol<StimRestApiRequest> {
  bool streamed;

  StimModelType model;

  StimRestApiRequest();


  /// Creates a new "apiRequest" of [StimRestApiRequest] type.
  StimRestApiRequest copyWith({@required
  dynamic name, bool streamed, @required
  StimModelType model, Set<StimModelTag> tags}) {
    return StimRestApiRequest()
        ..name = StimName.of(name ?? this.name)
        ..streamed = streamed ?? this.streamed
        ..model = model ?? this.model
        ..tags = tags ?? this.tags;
  }
}


class StimRestApiRequestScope {
  /// Creates a new "apiRequest" of [StimRestApiRequest] type.
  StimRestApiRequest of({@required
  dynamic name, bool streamed, @required
  StimModelType model, Set<StimModelTag> tags}) {
    return StimRestApiRequest()
        ..name = StimName.of(name)
        ..streamed = streamed
        ..model = model
        ..tags = tags ?? {};
  }
}
