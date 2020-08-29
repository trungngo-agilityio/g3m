library g3.stimpack.grpc.generated;


import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_meta.dart';
part 'grpc_package.dart';
part 'grpc_package__messages.dart';
part 'grpc_package__services.dart';
part 'grpc_message.dart';
part 'grpc_message__type.dart';
part 'grpc_method.dart';
part 'grpc_method__request.dart';
part 'grpc_method__response.dart';
part 'grpc_method_request.dart';
part 'grpc_method_response.dart';
part 'grpc_service.dart';
part 'grpc_service__methods.dart';



abstract class StimGrpcGrpc {
  StimMetaPack get meta;
  StimGrpcPackageScope get package;
  StimGrpcMessageScope get message;
  StimGrpcMethodScope get method;
  StimGrpcMethodRequestScope get methodRequest;
  StimGrpcMethodResponseScope get methodResponse;
  StimGrpcServiceScope get service;
}


class _StimGrpcGrpcImpl  implements StimGrpcGrpc {
  StimMetaPack _meta;

  _StimGrpcPackageScopeImpl _package;

  _StimGrpcMessageScopeImpl _message;

  _StimGrpcMethodScopeImpl _method;

  _StimGrpcMethodRequestScopeImpl _methodRequest;

  _StimGrpcMethodResponseScopeImpl _methodResponse;

  _StimGrpcServiceScopeImpl _service;


  _StimGrpcGrpcImpl() {
    _package = _StimGrpcPackageScopeImpl(this);
    _message = _StimGrpcMessageScopeImpl(this);
    _method = _StimGrpcMethodScopeImpl(this);
    _methodRequest = _StimGrpcMethodRequestScopeImpl(this);
    _methodResponse = _StimGrpcMethodResponseScopeImpl(this);
    _service = _StimGrpcServiceScopeImpl(this);
  }

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

  void init() {
    _package.init();
    _message.init();
    _method.init();
    _methodRequest.init();
    _methodResponse.init();
    _service.init();
    buildMeta();
    buildValues();
  }

  void _buildMeta() {
    final meta = stimpack.meta;
    final f = meta.field, t = meta.type, p = meta.preset, v = meta.value;
    final listKind = meta.kind.s.list;

    final packageType = t.of('package');
    final messageType = t.of('message');
    final methodType = t.of('method');
    final methodRequestType = t.of('methodRequest');
    final methodResponseType = t.of('methodResponse');
    final serviceType = t.of('service');

    packageType.fields += 
        f.of('messages', kind: listKind, type: messageType) + 
        f.of('services', kind: listKind, type: serviceType);

    messageType.fields += 
        f.of('type', type: typeType);

    methodType.fields += 
        f.of('request', type: methodRequestType) + 
        f.of('response', type: methodResponseType);

    serviceType.fields += 
        f.of('methods', kind: listKind, type: methodType);

    final allTypes = packageType + messageType + methodType + methodRequestType + methodResponseType + serviceType);
    _meta = meta.pack.of('grpc', types: allTypes);
    allTypes.pack.set(_meta);
  }
  // region custom code of grpc stimpack

  /// This function shall be call during the init process.
  void _buildValues() {
    /// build all preset values here
  }

// endregion custom code of grpc stimpack
}
StimGrpcGrpc  _stimGrpcGrpc;

extension StimGrpcGrpcExtension on Stimpack {
  StimGrpcGrpc get grpc {
    if (_stimGrpcGrpc == null) {
      final impl = _stimGrpcGrpc = _StimGrpcGrpcImpl();
      impl.init();
      return _stimGrpcGrpc;
    }
    
    return _stimGrpcGrpc;
  }
}
    