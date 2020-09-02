part of g3.stimpack.rest_api.generated;

class StimMetaXTypeXPreset {
  StimMetaTypeSet all;

  StimMetaType package;

  StimMetaType modelApi;

  StimMetaType api;

  StimMetaType modelApiKind;

  void init(StimMetaTypeScope scope) {
    all = scope.noneSet;
    all += package = scope.of('package');
    all += modelApi = scope.of('modelApi');
    all += api = scope.of('api');
    all += modelApiKind = scope.of('modelApiKind');
  }
}

extension StimMetaXTypeXPresetExtension on StimMetaTypeScope {
  StimMetaXTypeXPreset get forRestApi {
    final impl = stimpack.restApi as StimRestApiImpl;
    return impl._metaXTypeXPreset;
  }
}
