part of g3.stimpack.rest.generated;



class StimRestOnStimModelType {
  StimModelType api;

  StimModelType apiRequest;

  StimModelType apiResponse;

  StimModelType crudApi;

  StimModelType crudCreateOneApi;

  StimModelType crudUpdateOneApi;

  StimModelType crudFindOneApi;

  StimModelType crudDeleteOneApi;

  StimModelType crudFindApi;

  StimModelType crudDeleteApi;
}


class StimRestOnStimRbacResource {
  StimRbacResource restApi;
}



extension StimRestOnStimModelTypeExtension on StimModelTypeScope {
  StimRestOnStimModelType get rest {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimRest.stimRestInstance().onStimModelType;
  }
}


extension StimRestOnStimRbacResourceExtension on StimRbacResourceScope {
  StimRestOnStimRbacResource get rest {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimRest.stimRestInstance().onStimRbacResource;
  }
}
