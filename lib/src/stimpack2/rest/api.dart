part of g3.stimpack2.rest;

class StimRestApiScope {
  static StimRestApi of({
    dynamic name,
    Set<StimModelTag> tags,
    StimRestRequest request,
    StimRestResponse response,
  }) {
    final res = StimRestApi()
      ..name = StimName.of(name)
      ..tags = tags
      ..request = request
      ..response = response;

    return res;
  }
}

class StimRestApi extends StimModelSymbol<StimRestApi> {
  // The api request object
  StimRestRequest request;

  // The api response object
  StimRestResponse response;

  StimRestApi();
}
