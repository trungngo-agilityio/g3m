part of g3.stimpack.rest.generated;



class StimRestApiResponse extends StimModelSymbol<StimRestApiResponse> {
  bool streamed;

  Set<StimModelField> fields;

  StimRestApiResponseRef _ref;

  StimRestApiResponseRef get ref {
    return _ref ??= StimRestApiResponseRef();
  }
  StimRestApiResponse();
}


class StimRestApiResponseRef extends StimSymbolRef<StimRestApiResponse> implements StimRestApiResponse {

}


class StimRestApiResponseScope {
  /// Creates a new "apiResponse" of [StimRestApiResponse] type.
  StimRestApiResponse of({dynamic name, bool streamed, Set<StimModelField> fields, Set<StimModelTag> tags}) {
    return StimRestApiResponse()
        ..name = StimName.of(name)
        ..streamed = streamed
        ..fields = fields ?? {}
        ..tags = tags ?? {};
  }
}
