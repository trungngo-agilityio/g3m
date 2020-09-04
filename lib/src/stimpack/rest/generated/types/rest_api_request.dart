part of g3.stimpack.rest.generated;

class StimRestApiRequest extends StimModelSymbol<StimRestApiRequest> {
  bool streamed;

  Set<StimModelField> fields;

  StimRestApiRequest();

  StimRestApiRequest ref() {
    return StimRestApiRequestRef()..symbol = this;
  }

  /// Creates a new "apiRequest" of [StimRestApiRequest] type.
  StimRestApiRequest refWith(
      {dynamic name,
      bool streamed,
      Set<StimModelField> fields,
      Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (streamed != null) {
      res.streamed = streamed;
    }
    if (fields != null) {
      res.fields = fields;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}

class StimRestApiRequestRef extends StimSymbolRef<StimRestApiRequest>
    implements StimRestApiRequest {}

class StimRestApiRequestScope {
  /// Creates a new "apiRequest" of [StimRestApiRequest] type.
  StimRestApiRequest of(
      {dynamic name,
      bool streamed,
      Set<StimModelField> fields,
      Set<StimModelTag> tags}) {
    return StimRestApiRequest()
      ..name = StimName.of(name)
      ..streamed = streamed
      ..fields = fields ?? {}
      ..tags = tags ?? {};
  }
}
