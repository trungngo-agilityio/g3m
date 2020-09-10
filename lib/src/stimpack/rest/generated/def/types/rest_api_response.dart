part of g3.stimpack.rest.generated;



class StimRestApiResponse extends StimModelSymbol<StimRestApiResponse> {
  bool streamed;

  StimModelType model;

  StimRestApiResponse();


  StimRestApiResponse ref() {
    return StimRestApiResponseRef()..symbol = this;
  }

  /// Creates a new "apiResponse" of [StimRestApiResponse] type.
  StimRestApiResponse refWith({dynamic name, bool streamed, StimModelType model, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (streamed != null) {
      res.streamed = streamed;
    }

    if (model != null) {
      res.model = model;
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
  StimRestApiResponse of({@required
  dynamic name, bool streamed, @required
  StimModelType model, Set<StimModelTag> tags}) {
    return StimRestApiResponse()
        ..name = StimName.of(name)
        ..streamed = streamed
        ..model = model
        ..tags = tags ?? {};
  }
}
