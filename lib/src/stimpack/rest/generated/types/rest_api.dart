part of g3.stimpack.rest.generated;

class StimRestApi extends StimModelSymbol<StimRestApi> {
  StimRbacPolicy policy;

  StimRestApiRequest request;

  StimRestApiResponse response;

  StimRestApi();

  StimRestApi ref() {
    return StimRestApiRef()..symbol = this;
  }

  /// Creates a new "api" of [StimRestApi] type.
  StimRestApi refWith(
      {dynamic name,
      StimRbacPolicy policy,
      StimRestApiRequest request,
      StimRestApiResponse response,
      Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (policy != null) {
      res.policy = policy;
    }
    if (request != null) {
      res.request = request;
    }
    if (response != null) {
      res.response = response;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}

class StimRestApiRef extends StimSymbolRef<StimRestApi> implements StimRestApi {
}

class StimRestApiScope {
  /// Creates a new "api" of [StimRestApi] type.
  StimRestApi of(
      {dynamic name,
      StimRbacPolicy policy,
      StimRestApiRequest request,
      StimRestApiResponse response,
      Set<StimModelTag> tags}) {
    return StimRestApi()
      ..name = StimName.of(name)
      ..policy = policy
      ..request = request
      ..response = response
      ..tags = tags ?? {};
  }
}
