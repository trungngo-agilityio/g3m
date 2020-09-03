part of g3.stimpack.rest.generated;



class StimRestApiRequest extends StimModelSymbol<StimRestApiRequest> {
  bool streamed;

  Set<StimModelField> fields;

  StimRestApiRequestRef _ref;

  StimRestApiRequestRef get ref {
    return _ref ??= StimRestApiRequestRef();
  }
  StimRestApiRequest();
}


class StimRestApiRequestRef extends StimSymbolRef<StimRestApiRequest> implements StimRestApiRequest {

}


class StimRestApiRequestScope {
  /// Creates a new "apiRequest" of [StimRestApiRequest] type.
  StimRestApiRequest of({dynamic name, bool streamed, Set<StimModelField> fields, Set<StimModelTag> tags}) {
    return StimRestApiRequest()
        ..name = StimName.of(name)
        ..streamed = streamed
        ..fields = fields ?? {}
        ..tags = tags ?? {};
  }
}
