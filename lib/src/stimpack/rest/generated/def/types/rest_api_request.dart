part of g3.stimpack.rest.generated;



class StimRestApiRequest extends StimModelSymbol<StimRestApiRequest> {
  bool streamed;

  StimModelType model;

  StimRestApiRequest();


  StimRestApiRequest ref() {
    return StimRestApiRequestRef()..symbol = this;
  }

  /// Creates a new "apiRequest" of [StimRestApiRequest] type.
  StimRestApiRequest refWith({dynamic name, bool streamed, StimModelType model, Set<StimModelTag> tags}) {
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


class StimRestApiRequestRef extends StimSymbolRef<StimRestApiRequest> implements StimRestApiRequest {

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
