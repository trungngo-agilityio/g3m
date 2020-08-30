library g3.stimpack.grpc.generated;


import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_meta.dart';
part 'grpc_presets.dart';
part 'grpc_type.dart';
part 'grpc_type__range.dart';
part 'grpc_type__patterns.dart';
part 'grpc_field.dart';
part 'grpc_field__range.dart';
part 'grpc_field__patterns.dart';
part 'grpc_rule.dart';
part 'grpc_rule__range.dart';
part 'grpc_rule__patterns.dart';
part 'grpc_pattern.dart';
part 'grpc_pattern__range.dart';
part 'grpc_pattern__patterns.dart';
part 'grpc_range.dart';
part 'grpc_range__range.dart';
part 'grpc_range__patterns.dart';
part 'grpc_package.dart';
part 'grpc_package__range.dart';
part 'grpc_package__patterns.dart';
part 'grpc_package__messages.dart';
part 'grpc_package__services.dart';
part 'grpc_message.dart';
part 'grpc_message__range.dart';
part 'grpc_message__patterns.dart';
part 'grpc_message__type.dart';
part 'grpc_method.dart';
part 'grpc_method__range.dart';
part 'grpc_method__patterns.dart';
part 'grpc_method__request.dart';
part 'grpc_method__response.dart';
part 'grpc_method_request.dart';
part 'grpc_method_request__range.dart';
part 'grpc_method_request__patterns.dart';
part 'grpc_method_response.dart';
part 'grpc_method_response__range.dart';
part 'grpc_method_response__patterns.dart';
part 'grpc_service.dart';
part 'grpc_service__range.dart';
part 'grpc_service__patterns.dart';
part 'grpc_service__methods.dart';



abstract class StimGrpcGrpc {
  StimMetaPack get meta;
  StimModelTypeScope get type;
  StimModelFieldScope get field;
  StimModelRuleScope get rule;
  StimModelPatternScope get pattern;
  StimModelRangeScope get range;
  StimGrpcPackageScope get package;
  StimGrpcMessageScope get message;
  StimGrpcMethodScope get method;
  StimGrpcMethodRequestScope get methodRequest;
  StimGrpcMethodResponseScope get methodResponse;
  StimGrpcServiceScope get service;
}


class _StimGrpcGrpcImpl  implements StimGrpcGrpc {
  StimMetaPack _meta;

  _StimModelTypeScopeImpl _type;

  _StimModelFieldScopeImpl _field;

  _StimModelRuleScopeImpl _rule;

  _StimModelPatternScopeImpl _pattern;

  _StimModelRangeScopeImpl _range;

  _StimGrpcPackageScopeImpl _package;

  _StimGrpcMessageScopeImpl _message;

  _StimGrpcMethodScopeImpl _method;

  _StimGrpcMethodRequestScopeImpl _methodRequest;

  _StimGrpcMethodResponseScopeImpl _methodResponse;

  _StimGrpcServiceScopeImpl _service;

  @override
  StimMetaPack get meta {
    return _meta;
  }
  @override
  _StimModelTypeScopeImpl get type {
    return _type;
  }
  @override
  _StimModelFieldScopeImpl get field {
    return _field;
  }
  @override
  _StimModelRuleScopeImpl get rule {
    return _rule;
  }
  @override
  _StimModelPatternScopeImpl get pattern {
    return _pattern;
  }
  @override
  _StimModelRangeScopeImpl get range {
    return _range;
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

  _StimGrpcGrpcImpl() {
    _type = _StimModelTypeScopeImpl();
    _field = _StimModelFieldScopeImpl();
    _rule = _StimModelRuleScopeImpl();
    _pattern = _StimModelPatternScopeImpl();
    _range = _StimModelRangeScopeImpl();
    _package = _StimGrpcPackageScopeImpl();
    _message = _StimGrpcMessageScopeImpl();
    _method = _StimGrpcMethodScopeImpl();
    _methodRequest = _StimGrpcMethodRequestScopeImpl();
    _methodResponse = _StimGrpcMethodResponseScopeImpl();
    _service = _StimGrpcServiceScopeImpl();
  }


  void init() {
    _type.init();
    _field.init();
    _rule.init();
    _pattern.init();
    _range.init();
    _package.init();
    _message.init();
    _method.init();
    _methodRequest.init();
    _methodResponse.init();
    _service.init();
    _buildMeta();
    _buildValues();
  }

  void _buildMeta() {
    final meta = stimpack.meta;
    final pack = meta.pack.of('grpc');
    final f = meta.field, t = meta.type.forGrpc, p = meta.preset, v = meta.value;
    final listKind = meta.kind.forMeta.list;

    final  typeType = t.type;
    final  fieldType = t.field;
    final  ruleType = t.rule;
    final  patternType = t.pattern;
    final  rangeType = t.range;
    final  packageType = t.package;
    final  messageType = t.message;
    final  methodType = t.method;
    final  methodRequestType = t.methodRequest;
    final  methodResponseType = t.methodResponse;
    final  serviceType = t.service;

    typeType.fields.set( 
        f.of('range', kind: listKind, type: rangeType) + 
        f.of('patterns', kind: listKind, type: patternType));

    fieldType.fields.set( 
        f.of('range', kind: listKind, type: rangeType) + 
        f.of('patterns', kind: listKind, type: patternType));

    ruleType.fields.set( 
        f.of('range', kind: listKind, type: rangeType) + 
        f.of('patterns', kind: listKind, type: patternType));

    patternType.fields.set( 
        f.of('range', kind: listKind, type: rangeType) + 
        f.of('patterns', kind: listKind, type: patternType));

    rangeType.fields.set( 
        f.of('range', kind: listKind, type: rangeType) + 
        f.of('patterns', kind: listKind, type: patternType));

    packageType.fields.set( 
        f.of('range', kind: listKind, type: rangeType) + 
        f.of('patterns', kind: listKind, type: patternType) + 
        f.of('messages', kind: listKind, type: messageType) + 
        f.of('services', kind: listKind, type: serviceType));

    messageType.fields.set( 
        f.of('range', kind: listKind, type: rangeType) + 
        f.of('patterns', kind: listKind, type: patternType) + 
        f.of('type', type: typeType));

    methodType.fields.set( 
        f.of('range', kind: listKind, type: rangeType) + 
        f.of('patterns', kind: listKind, type: patternType) + 
        f.of('request', type: methodRequestType) + 
        f.of('response', type: methodResponseType));

    methodRequestType.fields.set( 
        f.of('range', kind: listKind, type: rangeType) + 
        f.of('patterns', kind: listKind, type: patternType));

    methodResponseType.fields.set( 
        f.of('range', kind: listKind, type: rangeType) + 
        f.of('patterns', kind: listKind, type: patternType));

    serviceType.fields.set( 
        f.of('range', kind: listKind, type: rangeType) + 
        f.of('patterns', kind: listKind, type: patternType) + 
        f.of('methods', kind: listKind, type: methodType));

    pack.presets.set(
        p.of('validation', type: stimpack.meta.type.forModel.rule, values: 
              v.of('unique') + 
              v.of('required') + 
              v.of('text') + 
              v.of('desc') + 
              v.of('long text') + 
              v.of('short text') + 
              v.of('id') + 
              v.of('uuid v4') + 
              v.of('slug') + 
              v.of('ipv4') + 
              v.of('ipv6') + 
              v.of('ip') + 
              v.of('url') + 
              v.of('email') + 
              v.of('username') + 
              v.of('password') + 
              v.of('phone') + 
              v.of('alpha'),)
         + 
        p.of('validation', type: stimpack.meta.type.forModel.pattern, values: 
              v.of('id') + 
              v.of('uuid v4') + 
              v.of('slug') + 
              v.of('ipv4') + 
              v.of('ipv6') + 
              v.of('ip') + 
              v.of('url') + 
              v.of('email') + 
              v.of('username') + 
              v.of('password') + 
              v.of('phone') + 
              v.of('alpha'),)
         + 
        p.of('user', type: stimpack.meta.type.forModel.field, values: 
              v.of('user id') + 
              v.of('user name') + 
              v.of('email') + 
              v.of('email verified') + 
              v.of('phone') + 
              v.of('phone verified') + 
              v.of('password') + 
              v.of('confirm password') + 
              v.of('name') + 
              v.of('desc') + 
              v.of('first name') + 
              v.of('last name') + 
              v.of('middle name') + 
              v.of('gender') + 
              v.of('birthday') + 
              v.of('photo url') + 
              v.of('avatar url'),)
         + 
        p.of('pagination', type: stimpack.meta.type.forModel.field, values: 
              v.of('total') + 
              v.of('count') + 
              v.of('size') + 
              v.of('index') + 
              v.of('page size') + 
              v.of('page index') + 
              v.of('offset') + 
              v.of('limit'),)
         + 
        p.of('db', type: stimpack.meta.type.forModel.field, values: 
              v.of('id') + 
              v.of('created at') + 
              v.of('modified at') + 
              v.of('version'),)
         + 
        p.of('grpc', type: stimpack.meta.type.forModel.type, values: 
              v.of('double') + 
              v.of('float') + 
              v.of('int32') + 
              v.of('int64') + 
              v.of('uint32') + 
              v.of('uint64') + 
              v.of('sint32') + 
              v.of('sint64') + 
              v.of('fixed32') + 
              v.of('fixed64') + 
              v.of('sfixed32') + 
              v.of('sfixed64') + 
              v.of('string') + 
              v.of('bytes'),)
         + 
        p.of('date', type: stimpack.meta.type.forModel.type, values: 
              v.of('timestamp') + 
              v.of('date') + 
              v.of('time') + 
              v.of('datetime') + 
              v.of('local date') + 
              v.of('local time') + 
              v.of('local datetime'),)
         + 
        p.of('auth', type: stimpack.meta.type.forModel.type, values: 
              v.of('user') + 
              v.of('user profile') + 
              v.of('access token'),)
         + 
        p.of('common', type: stimpack.meta.type.forModel.type, values: 
              v.of('url'),)
         + 
        p.of('grpc', type: stimpack.meta.type.forMeta.type, values: 
              v.of('type') + 
              v.of('field') + 
              v.of('rule') + 
              v.of('pattern') + 
              v.of('range') + 
              v.of('package') + 
              v.of('message') + 
              v.of('method') + 
              v.of('methodRequest') + 
              v.of('methodResponse') + 
              v.of('service'),));

    pack.types.set(typeType + fieldType + ruleType + patternType + rangeType + packageType + messageType + methodType + methodRequestType + methodResponseType + serviceType);
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
    