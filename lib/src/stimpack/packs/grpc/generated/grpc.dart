library g3.stimpack.grpc.generated;

import 'package:g3m/stimpack_base.dart';
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

abstract class StimGrpcGrpc {
  StimMetaPack get meta;

  StimGrpcPackageScope get package;
  StimGrpcMessageScope get message;
  StimGrpcMethodScope get method;
  StimGrpcMethodRequestScope get methodRequest;
  StimGrpcMethodResponseScope get methodResponse;

}

class _StimGrpcGrpcImpl implements StimGrpcGrpc {
  StimMetaPack _meta;

  
  _StimGrpcPackageScopeImpl _package;
  
  _StimGrpcMessageScopeImpl _message;
  
  _StimGrpcMethodScopeImpl _method;
  
  _StimGrpcMethodRequestScopeImpl _methodRequest;
  
  _StimGrpcMethodResponseScopeImpl _methodResponse;


  @override
  StimMetaPack get meta => _meta;

  
  @override
  StimGrpcPackageScope get package => _package;
  
  @override
  StimGrpcMessageScope get message => _message;
  
  @override
  StimGrpcMethodScope get method => _method;
  
  @override
  StimGrpcMethodRequestScope get methodRequest => _methodRequest;
  
  @override
  StimGrpcMethodResponseScope get methodResponse => _methodResponse;

  _StimGrpcGrpcImpl() {
    _package = _StimGrpcPackageScopeImpl._(this);
    _message = _StimGrpcMessageScopeImpl._(this);
    _method = _StimGrpcMethodScopeImpl._(this);
    _methodRequest = _StimGrpcMethodRequestScopeImpl._(this);
    _methodResponse = _StimGrpcMethodResponseScopeImpl._(this);

  }
  
  void init() {
    _package.init();
    _message.init();
    _method.init();
    _methodRequest.init();
    _methodResponse.init();

    _buildMeta();
    _buildValues();
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

    packageType.fields += 
        f.of('messages', kind: listKind, type: messageType) + 
        f.of('services', kind: listKind, type: serviceType);

    messageType.fields += 
        f.of('type', type: typeType);

    methodType.fields += 
        f.of('request', type: methodRequestType) + 
        f.of('response', type: methodResponseType);

    final allTypes = packageType + messageType + methodType + methodRequestType + methodResponseType);
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
    