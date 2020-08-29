part of g3.stimpack.grpc.generated;



class StimMetaTypeGrpcPreset {
  StimMetaTypeSet all;

  StimMetaType package;

  StimMetaType message;

  StimMetaType method;

  StimMetaType methodRequest;

  StimMetaType methodResponse;

  StimMetaType service;


  StimMetaTypeGrpcPreset(StimMetaTypeScope scope) {
    all = scope.noneSet;
    all += package = scope.of('package');
    all += message = scope.of('message');
    all += method = scope.of('method');
    all += methodRequest = scope.of('methodRequest');
    all += methodResponse = scope.of('methodResponse');
    all += service = scope.of('service');
  }
}
StimMetaTypeGrpcPreset  _extStimMetaTypeGrpcPreset;

extension StimMetaTypeGrpcPresetExtension on StimMetaTypeScope {
  StimMetaTypeGrpcPreset get forGrpc {
    return _extStimMetaTypeGrpcPreset ??= StimMetaTypeGrpcPreset(stimpack.meta.type);
  }
}
    