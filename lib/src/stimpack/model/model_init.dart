part of g3.stimpack.model;

class StimModel extends StimPack {
  final StimModelPackageScope package;
  final StimModelTagScope tag;
  final StimModelTypeScope type;
  final StimModelFieldScope field;
  final StimModelFieldFilterScope filter;
  final StimModelFieldRuleScope rule;
  final StimModelFuncScope func;
  final StimModelPatternScope pattern;
  final StimModelRangeScope range;
  final StimModelHttpStatusScope httpStatus;
  final StimModelGrpcStatusScope grpcStatus;

  StimModel()
      : package = StimModelPackageScope(),
        tag = StimModelTagScope(),
        type = StimModelTypeScope(),
        field = StimModelFieldScope(),
        filter = StimModelFieldFilterScope(),
        rule = StimModelFieldRuleScope(),
        func = StimModelFuncScope(),
        pattern = StimModelPatternScope(),
        range = StimModelRangeScope(),
        httpStatus = StimModelHttpStatusScope(),
        grpcStatus = StimModelGrpcStatusScope(),
        super('model');

  void init() {
    _httpStatuses();
    _grpcStatuses();
    _patterns();
    _ranges();
    _rules();
    _filters();
    _packages();
    _primitiveTypes();
    _collectionTypes();
    _metaTypes();
    _fields();
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

  void _patterns() {
    final p = pattern;
    p.id = p.of(name: 'id');
    p.uuidV4 = p.of(name: 'uuid v4');
    p.slug = p.of(name: 'slug');

    p.ipv4 = p.of(name: 'ipv4');
    p.ipv6 = p.of(name: 'ipv6');
    p.ip = p.of(name: 'ip');

    p.url = p.of(name: 'url');
    p.email = p.of(name: 'email');
    p.username = p.of(name: 'username');
    p.password = p.of(name: 'password');
    p.phone = p.of(name: 'phone');
    p.zipCode = p.of(name: 'zip code');

    // data type pattern
    p.string = p.of(name: 'string');
    p.num = p.of(name: 'num');
    p.int = p.of(name: 'int');
    p.double = p.of(name: 'double');
    p.bool = p.of(name: 'bool');
    p.duration = p.of(name: 'duration');
    p.uri = p.of(name: 'uri');
    p.date = p.of(name: 'date');
    p.dateTime = p.of(name: 'date time');
    p.time = p.of(name: 'time');
  }

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
      ..unique = rule.of(name: 'unique')
      ..indexed = rule.of(name: 'indexed')
      ..authorized = rule.of(name: 'authorized')
      ..readOnly = rule.of(name: 'read only')
      ..writeOnly = rule.of(name: 'write only')
      ..systemOnly = rule.of(name: 'system only')
      ..autoIncreased = rule.of(name: 'auto increased')
      ..transient = rule.of(name: 'transient');

    // pattern based fields
    final p = pattern;
    rule
      ..id = _patternRule(p.id)
      ..uuidV4 = _patternRule(p.uuidV4)
      ..slug = _patternRule(p.slug)
      ..ipv4 = _patternRule(p.ipv4)
      ..ipv6 = _patternRule(p.ipv6)
      ..ip = _patternRule(p.url)
      ..email = _patternRule(p.email)
      ..username = _patternRule(p.username)
      ..password = _patternRule(p.password)
      ..phone = _patternRule(p.phone)
      ..zipCode = _patternRule(p.zipCode);

    // pattern based - data type
    rule
      ..string = _patternRule(p.string)
      ..num = _patternRule(p.num)
      ..bool = _patternRule(p.bool)
      ..duration = _patternRule(p.duration)
      ..uri = _patternRule(p.uri)
      ..date = _patternRule(p.date)
      ..dateTime = _patternRule(p.dateTime)
      ..time = _patternRule(p.time);
  }

  StimModelFieldRule _patternRule(StimModelPattern pattern) {
    return rule.of(name: pattern.name, patterns: {pattern});
  }

  // ===========================================================================
  // Filters
  // ===========================================================================

  void _filters() {
    final f = filter;

    f.isNull = _filter('null');
    f.isIn = _filter('is in');
    f.exact = _filter('exact');

    f.stringFilters = {
      f.isNull,
      f.isIn,
      f.exact,
      f.iExact = _filter('i exact'),
      f.startsWith = _filter('starts with'),
      f.iStartsWith = _filter('i starts with'),
      f.endsWith = _filter('ends with'),
      f.iEndsWith = _filter('i ends with'),
      f.contains = _filter('contains'),
      f.iContains = _filter('i contains'),
      f.iExact = _filter('i exact'),
      f.regex = _filter('i regex'),
    };

    f.rangeFilters = {
      f.gt = _filter('gt'),
      f.gte = _filter('gte'),
      f.lt = _filter('lt'),
      f.lte = _filter('lte'),
      f.range = _filter('range'),
    };

    f.numberFilters = {
      f.isNull,
      f.exact,
      f.isIn,
      ...f.rangeFilters,
    };

    f.ago = _filter('ago');
    f.dateFilters = {
      f.isNull,
      f.exact,
      f.isIn,
      ...f.rangeFilters,
      f.ago,
      f.date = _filter('date'),
      f.year = _filter('year'),
      f.month = _filter('month'),
      f.day = _filter('day'),
      f.week = _filter('week'),
      f.weekDay = _filter('week day'),
      f.quarter = _filter('quarter'),
    };

    f.timeFilters = {
      f.isNull,
      f.exact,
      f.isIn,
      f.ago,
      f.time = _filter('time'),
      f.hour = _filter('hour'),
      f.minute = _filter('minute'),
      f.second = _filter('second'),
    };

    f.dateTimeFilters = f.dateFilters + f.timeFilters;
  }

  StimModelFieldFilter _filter(String name) => filter.of(name: name);

  // ===========================================================================
  // Packages
  // ===========================================================================

  void _packages() {}

  // ===========================================================================
  // Types
  // ===========================================================================

  void _primitiveTypes() {
    final t = type;
    t.primitiveTypes = {
      t.string = t.fromDart(String),
      t.num = t.fromDart(num),
      t.int = t.fromDart(int),
      t.double = t.fromDart(double),
      t.bool = t.fromDart(bool),
      t.duration = t.fromDart(Duration),
      t.uri = t.fromDart(Uri),
      t.type = t.fromDart(Type),
    };
  }

  void _collectionTypes() {
    final t = type;
    t.collectionTypes = {
      t.map = t.fromDart(Map)..name ^= 'map',
      t.list = t.fromDart(List)..name ^= 'list',
      t.set = t.fromDart(Set)..name ^= 'set',
    };
  }

  void _metaTypes() {
    package.model = package.of(name: 'model');

    final mt = type.model = StimModelTypes();
    // name
    mt.name = type.fromDart(StimName);
    mt.nameSet = type.setOf(name: 'name set', item: mt.name);

    // func
    mt.funcCode = type.fromDart(StimModelFuncCode);
    mt.funcCodeSet = type.setOf(name: 'func set', item: mt.funcCode);

    // tag
    mt.tag = _symbolOf('tag');
    mt.tagSet = _symbolSetOf(mt.tag);

    // package
    mt.package = _symbolOf('package');
    mt.typeSet = _symbolSetOf(mt.package);

    // type
    mt.type = _symbolOf('type');
    mt.typeSet = _symbolSetOf(mt.type);

    // field
    mt.field = _symbolOf('field');
    mt.fieldSet = _symbolSetOf(mt.field);

    // filter
    mt.filter = _symbolOf('filter');
    mt.filterSet = _symbolSetOf(mt.filter);

    // pattern
    mt.pattern = _symbolOf('pattern');
    mt.patternSet = _symbolSetOf(mt.pattern);

    // range
    mt.range = _symbolOf('range');
    mt.rangeSet = _symbolSetOf(mt.range);

    // rule
    mt.rule = _symbolOf('rule');
    mt.ruleSet = _symbolSetOf(mt.rule);

    // error
    mt.error = _symbolOf('error');
    mt.errorSet = _symbolSetOf(mt.error);

    // http status
    mt.httpStatus = _symbolOf('http status');
    mt.httpStatusSet = _symbolSetOf(mt.httpStatus);

    // grpc status
    mt.grpcStatus = _symbolOf('grpc status');
    mt.grpcStatusSet = _symbolSetOf(mt.grpcStatus);
  }

  void _fields() {
    final f = field, t = type;
    final mf = f.model = StimModelFields();

    // Sets of fields.
    mf.fieldSet = f.of(name: 'fields', type: t.model.fieldSet);
  }

  StimModelType _symbolOf(String name) {
    return type.of(
        name: 'stim model $name', package: package.model, fields: null);
  }

  StimModelType _symbolSetOf(StimModelType item) {
    return type.collectionOf(
      name: item.name << 'set<' >> '>',
      package: package.model,
      fields: null,
      collection: type.set,
      item: item,
    );
  }
}
