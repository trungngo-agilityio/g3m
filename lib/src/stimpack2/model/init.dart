part of g3.stimpack2.model;

StimModel _model;

extension StimModelExtension on Stimpack {
  StimModel get model {
    return _model ??= StimModel();
  }
}

class StimModel extends StimPack {
  final StimModelPackageScope package;
  final StimModelTagScope tag;
  final StimModelTypeScope type;
  final StimModelFieldScope field;
  final StimModelFieldRuleScope rule;
  final StimModelPatternScope pattern;
  final StimModelRangeScope range;
  final StimModelHttpStatusScope httpStatus;
  final StimModelGrpcStatusScope grpcStatus;

  StimModel()
      : package = StimModelPackageScope(),
        tag = StimModelTagScope(),
        type = StimModelTypeScope(),
        field = StimModelFieldScope(),
        rule = StimModelFieldRuleScope(),
        pattern = StimModelPatternScope(),
        range = StimModelRangeScope(),
        httpStatus = StimModelHttpStatusScope(),
        grpcStatus = StimModelGrpcStatusScope(),
        super('model') {
    _httpStatuses();
    _grpcStatuses();
    _patterns();
    _ranges();
    _rules();
    _packages();
    _primitiveTypes();
    _collectionTypes();
  }

  // ===========================================================================
  // Http Status
  // ===========================================================================

  void _httpStatuses() {
    _build200x();
    _build300x();
    _build400x();
    _build500x();

    httpStatus.ok200 = _http('ok', 200);
  }

  void _build200x() {
    final s = httpStatus;
    s.x200 = {
      s.ok200 = _http('ok', 200),
      s.created201 = _http('created', 201),
      s.accepted202 = _http('accepted', 202),
      s.nonAuthoritativeInfo203 = _http('non authoritative info', 203),
      s.noContent204 = _http('no content', 204),
    };
  }

  void _build300x() {
    final s = httpStatus;
    s.x300 = {
      s.multipleChoices300 = _http('multiple choices', 300),
      s.movedPermanently301 = _http('moved permanently', 301),
      s.found302 = _http('found', 302),
      s.seeOther303 = _http('see other', 303),
      s.notModified304 = _http('not modified', 304),
      s.useProxy305 = _http('use proxy', 305),
      s.switchProxy306 = _http('switch proxy', 306),
      s.temporarilyRedirected307 = _http('temporarily redirected', 307),
      s.permanentRedirected308 = _http('permanentRedirected', 308),
    };
  }

  void _build400x() {
    final s = httpStatus;
    s.x400 = {
      s.badRequest400 = _http('bad request', 400),
      s.unauthorized401 = _http('unauthorized', 401),
      s.paymentRequired402 = _http('payment required', 402),
      s.forbidden403 = _http('forbidden', 403),
      s.notFound404 = _http('not found', 404),
      s.methodNotAllowed405 = _http('method not allowed', 405),
      s.notAcceptable406 = _http('not acceptable', 406),
      s.proxyAuthenticationRequired407 =
          _http('proxy authentication required', 407),
      s.requestTimeout408 = _http('request timeout', 408),
      s.conflict409 = _http('conflict', 409),
      s.gone410 = _http('gone', 410),
      s.lengthRequired411 = _http('length required', 411),
      s.preconditionFailed412 = _http('precondition failed', 412),
      s.payloadTooLarge413 = _http('payload too large', 413),
      s.uriTooLong414 = _http('uri too long', 414),
      s.unsupportedMediaType415 = _http('unsupported media type', 415),
      s.rangeNotSatisfiable416 = _http('range not satisfiable', 416),
      s.expectationFailed417 = _http('expectation failed', 417),
      s.tooManyRequest429 = _http('too many request', 429),
      s.clientCloseRequest499 = _http('client close request', 499),
    };
  }

  void _build500x() {
    final s = httpStatus;
    s.x500 = {
      s.internalServerError500 = _http('internal server error', 500),
      s.notImplemented501 = _http('not implemented', 501),
      s.badGateway502 = _http('bad gateway', 502),
      s.serviceUnavailable503 = _http('service unavailable', 503),
      s.gatewayTimeout504 = _http('gateway timeout', 504),
      s.httpVersionNotSupported505 = _http('httpVersionNotSupported', 505),
    };
  }

  StimModelHttpStatus _http(String name, int code) {
    return httpStatus.of(name: name, code: code);
  }

  // ===========================================================================
  // Grpc Status
  // ===========================================================================

  void _grpcStatuses() {
    final s = grpcStatus;
    s.ok0 = _grpc('ok', 0, httpStatus.ok200);
    s.cancelled1 = _grpc('cancelled', 1, httpStatus.clientCloseRequest499);
    s.unknown2 = _grpc('unknown', 2, httpStatus.internalServerError500);
    s.invalidArgument3 = _grpc('invalid argument', 3, httpStatus.badRequest400);
    s.deadlineExceeded4 =
        _grpc('deadline exceed', 4, httpStatus.gatewayTimeout504);
    s.notFound5 = _grpc('not found', 5, httpStatus.notFound404);
    s.alreadyExists6 = _grpc('already exists', 6, httpStatus.conflict409);
    s.permissionDenied7 =
        _grpc('permission denied', 7, httpStatus.forbidden403);
    s.resourceExhausted8 =
        _grpc('resource exhausted', 8, httpStatus.tooManyRequest429);
    s.failedPrecondition9 =
        _grpc('failed precondition', 9, httpStatus.badRequest400);
    s.aborted10 = _grpc('aborted', 10, httpStatus.conflict409);
    s.outOfRange11 = _grpc('out of range', 11, httpStatus.badRequest400);
    s.unimplemented12 = _grpc('unimplemented', 12, httpStatus.badRequest400);
    s.internal13 = _grpc('internal', 13, httpStatus.internalServerError500);
    s.unavailable14 =
        _grpc('unavailable', 14, httpStatus.serviceUnavailable503);
    s.dataLoss15 = _grpc('data loss', 15, httpStatus.internalServerError500);
    s.unauthenticated16 =
        _grpc('unauthenticated', 16, httpStatus.unauthorized401);
  }

  StimModelGrpcStatus _grpc(
      String name, int code, StimModelHttpStatus httpStatus) {
    return grpcStatus.of(name: name, code: code, httpStatus: httpStatus);
  }

  // ===========================================================================
  // Patterns
  // ===========================================================================

  void _patterns() {}

  // ===========================================================================
  // Ranges
  // ===========================================================================
  void _ranges() {}

  // ===========================================================================
  // Rules
  // ===========================================================================
  void _rules() {
    rule
      ..required = rule.of(name: 'required')
      ..unique = rule.of(name: 'unique');
  }

  void _packages() {
    package..dart = package.of(name: 'dart');
  }

  void _primitiveTypes() {
    final t = type;
    t.primitiveTypes = {
      t.num = _t('num'),
      t.int = _t('int'),
      t.double = _t('double'),
      t.bool = _t('bool'),
      t.duration = _t('duration'),
      t.uri = _t('date time'),
      t.type = _t('type'),
    };
  }

  void _collectionTypes() {
    final t = type;
    t.collectionTypes = {
      t.map = _t('map'),
      t.list = _t('list'),
      t.set = _t('set')
    };
  }

  StimModelType _t(String name) =>
      type.primitiveOf(name: name, package: package.dart);
}
