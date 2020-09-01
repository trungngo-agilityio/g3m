part of g3.stimpack2.rest;

StimRest _rest;

extension StimModelExtension on Stimpack {
  StimRest get rest {
    return _rest ??= StimRest();
  }
}

class StimRest extends StimPack {
  final StimRestPackageScope package;
  final StimRestApiScope api;
  final StimRestCrudApiScope crudApi;
  final StimRestRequestScope request;
  final StimRestResponseScope response;

  StimRest()
      : package = StimRestPackageScope(),
        api = StimRestApiScope(),
        crudApi = StimRestCrudApiScope(),
        request = StimRestRequestScope(),
        response = StimRestResponseScope(),
        super('rest');
}
