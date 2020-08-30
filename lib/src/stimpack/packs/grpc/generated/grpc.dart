library g3.stimpack.grpc.generated;


import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_meta.dart';
part 'grpc_presets.dart';
part 'grpc__package.dart';
part 'grpc__package__messages.dart';
part 'grpc__package__services.dart';
part 'grpc__message.dart';
part 'grpc__message__type.dart';
part 'grpc__method.dart';
part 'grpc__method__request.dart';
part 'grpc__method__response.dart';
part 'grpc__method_request.dart';
part 'grpc__method_response.dart';
part 'grpc__service.dart';
part 'grpc__service__methods.dart';



abstract class StimGrpc {
  StimMetaPack get meta;
  StimGrpcPackageScope get package;
  StimGrpcMessageScope get message;
  StimGrpcMethodScope get method;
  StimGrpcMethodRequestScope get methodRequest;
  StimGrpcMethodResponseScope get methodResponse;
  StimGrpcServiceScope get service;
}


class StimGrpcImpl  implements StimGrpc {
  StimMetaPack _meta;

  _StimGrpcPackageScopeImpl _package;

  _StimGrpcMessageScopeImpl _message;

  _StimGrpcMethodScopeImpl _method;

  _StimGrpcMethodRequestScopeImpl _methodRequest;

  _StimGrpcMethodResponseScopeImpl _methodResponse;

  _StimGrpcServiceScopeImpl _service;

  StimMetaXTypeXPreset _metaXTypeXPreset;

  @override
  StimMetaPack get meta {
    return _meta;
  }
  @override
  _StimGrpcPackageScopeImpl get package {
    return _package;
  }
  @override
  _StimGrpcMessageScopeImpl get message {
    return _message;
  }
  @override
  _StimGrpcMethodScopeImpl get method {
    return _method;
  }
  @override
  _StimGrpcMethodRequestScopeImpl get methodRequest {
    return _methodRequest;
  }
  @override
  _StimGrpcMethodResponseScopeImpl get methodResponse {
    return _methodResponse;
  }
  @override
  _StimGrpcServiceScopeImpl get service {
    return _service;
  }

  StimGrpcImpl() {
    _package = _StimGrpcPackageScopeImpl();
    _message = _StimGrpcMessageScopeImpl();
    _method = _StimGrpcMethodScopeImpl();
    _methodRequest = _StimGrpcMethodRequestScopeImpl();
    _methodResponse = _StimGrpcMethodResponseScopeImpl();
    _service = _StimGrpcServiceScopeImpl();
    _metaXTypeXPreset = StimMetaXTypeXPreset();
  }


  void init() {
    _package.init();
    _message.init();
    _method.init();
    _methodRequest.init();
    _methodResponse.init();
    _service.init();
    _metaXTypeXPreset.init(stimpack.meta.type);
    _buildMeta();
    _buildValues();
  }

  void _buildMeta() {
    final meta = stimpack.meta;
    final pack = meta.pack.of('grpc');
    final f = meta.field, t = meta.type, p = meta.preset, v = meta.value;
    final setKind = meta.kind.forMeta.set;

    t.forGrpc.package.fields = f.noneSet +
        f.of('messages', kind: setKind, type: t.forGrpc.message) + 
        f.of('services', kind: setKind, type: t.forGrpc.service);

    t.forGrpc.message.fields = f.noneSet +
        f.of('type', type: t.forModel.type);

    t.forGrpc.method.fields = f.noneSet +
        f.of('request', type: t.forGrpc.methodRequest) + 
        f.of('response', type: t.forGrpc.methodResponse);

    t.forGrpc.service.fields = f.noneSet +
        f.of('methods', kind: setKind, type: t.forGrpc.method);

    pack.presets = p.noneSet +
        p.of('', type: t.forMeta.type, values: 
              v.of('package') + 
              v.of('message') + 
              v.of('method') + 
              v.of('methodRequest') + 
              v.of('methodResponse') + 
              v.of('service'),);

    pack.types = t.forGrpc.all;
    pack.types.pack.set(pack);
    _meta = pack;
  }
  // region custom code of grpc stimpack

  /// This function shall be call during the init process.
  void _buildValues() {
    /// build all preset values here
  }

  // endregion custom code of grpc stimpack
}
StimGrpc  _stimGrpc;

extension StimGrpcStimpackExtension on Stimpack {
  StimGrpc get grpc {
    if (_stimGrpc == null) {
      final impl = _stimGrpc = StimGrpcImpl();
      impl.init();
      return _stimGrpc;
    }
    
    return _stimGrpc;
  }
}
    