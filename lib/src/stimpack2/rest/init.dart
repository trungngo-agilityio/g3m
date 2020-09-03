part of g3.stimpack2.rest;

StimRest _rest;

extension StimModelExtension on StimpackRoot {
  StimRest get rest {
    return _rest ??= StimRest(stimpack.model);
  }
}

class StimRest extends StimPack {
  /// This package depends on model package.
  final StimModel _model;

  final StimRestPackageScope package;

  final StimRestApiScope api;
  final StimRestCrudApiScope crudApi;
  final StimRestRequestScope request;
  final StimRestResponseScope response;

  StimRest(this._model)
      : package = StimRestPackageScope(),
        api = StimRestApiScope(),
        crudApi = StimRestCrudApiScope(),
        request = StimRestRequestScope(),
        response = StimRestResponseScope(),
        super('rest') {}
}
