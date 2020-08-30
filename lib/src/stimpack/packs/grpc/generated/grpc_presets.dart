part of g3.stimpack.grpc.generated;



class StimMetaXTypeXPreset {
  StimMetaTypeSet all;

  StimMetaType package;

  StimMetaType message;

  StimMetaType method;

  StimMetaType methodRequest;

  StimMetaType methodResponse;

  StimMetaType service;


  void init(StimMetaTypeScope scope) {
    all = scope.noneSet;
    all += package = scope.of('package');
    all += message = scope.of('message');
    all += method = scope.of('method');
    all += methodRequest = scope.of('methodRequest');
    all += methodResponse = scope.of('methodResponse');
    all += service = scope.of('service');
  }
}
extension StimMetaXTypeXPresetExtension on StimMetaTypeScope {
  StimMetaXTypeXPreset get forGrpc {
    final impl = stimpack.grpc as StimGrpcImpl;
    return impl._metaXTypeXPreset; 
  }
}
    