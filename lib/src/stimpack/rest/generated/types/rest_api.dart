part of g3.stimpack.rest.generated;



class StimRestApi extends StimModelSymbol<StimRestApi> {
  StimRbacPolicy policy;

  StimRestApiRequest request;

  StimRestApiResponse response;

  StimRestApiRef _ref;

  StimRestApiRef get ref {
    return _ref ??= StimRestApiRef();
  }
  StimRestApi();
}


class StimRestApiRef extends StimSymbolRef<StimRestApi> implements StimRestApi {

}


class StimRestApiScope {
  /// Creates a new "api" of [StimRestApi] type.
  StimRestApi of({dynamic name, StimRbacPolicy policy, StimRestApiRequest request, StimRestApiResponse response, Set<StimModelTag> tags}) {
    return StimRestApi()
        ..name = StimName.of(name)
        ..policy = policy
        ..request = request
        ..response = response
        ..tags = tags ?? {};
  }
}
