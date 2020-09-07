part of g3.stimpack.rest.generated;



class StimRestApiResponse extends StimModelSymbol<StimRestApiResponse> {
  bool streamed;

  Set<StimModelField> fields;

  StimRestApiResponse();


  StimRestApiResponse ref() {
    return StimRestApiResponseRef()..symbol = this;
  }

  /// Creates a new "apiResponse" of [StimRestApiResponse] type.
  StimRestApiResponse refWith({dynamic name, bool streamed, Set<StimModelField> fields, Set<StimModelTag> tags}) {
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
