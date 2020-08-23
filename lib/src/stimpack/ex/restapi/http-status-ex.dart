part of g3.stimpack.ex;

/// See: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
///
class HttpStatusScopeEx extends HttpStatusScope {
  HttpStatus ok200,
      created201,
      accepted202,
      nonAuthoritativeInfo203,
      noContent204;

  HttpStatus multipleChoices300,
      movedPermanently301,
      found302,
      seeOther303,
      notModified304,
      useProxy305,
      switchProxy306,
      temporarilyRedirected307,
      permanentRedirected308;

  HttpStatus badRequest400,
      unauthorized401,
      paymentRequired402,
      forbidden403,
      notFound404,
      methodNotAllowed405,
      notAcceptable406,
      proxyAuthenticationRequired407,
      requestTimeout408,
      conflict409,
      gone410,
      lengthRequired411,
      preconditionFailed412,
      payloadTooLarge413,
      uriTooLong414,
      unsupportedMediaType415,
      rangeNotSatisfiable416,
      expectationFailed417,
      tooManyRequest429,
      clientCloseRequest499;

  HttpStatus internalServerError500,
      notImplemented501,
      badGateway502,
      serviceUnavailable503,
      gatewayTimeout504,
      httpVersionNotSupported505;

  HttpStatusScopeEx() : super() {
    _build200x();
    _build300x();
    _build400x();
    _build500x();
    ok200 = call('ok', 200);
  }

  void _build200x() {
    ok200 = call('ok', 200);
    created201 = call('created', 201);
    accepted202 = call('accepted', 202);
    nonAuthoritativeInfo203 = call('non authoritative info', 203);
    noContent204 = call('no content', 204);
  }

  void _build300x() {
    multipleChoices300 = call('multiple choices', 300);
    movedPermanently301 = call('moved permanently', 301);
    found302 = call('found', 302);
    seeOther303 = call('see other', 303);
    notModified304 = call('not modified', 304);
    useProxy305 = call('use proxy', 305);
    switchProxy306 = call('switch proxy', 306);
    temporarilyRedirected307 = call('temporarily redirected', 307);
    permanentRedirected308 = call('permanentRedirected', 308);
  }

  void _build400x() {
    badRequest400 = call('bad request', 400);
    unauthorized401 = call('unauthorized', 401);
    paymentRequired402 = call('payment required', 402);
    forbidden403 = call('forbidden', 403);
    notFound404 = call('not found', 404);
    methodNotAllowed405 = call('method not allowed', 405);
    notAcceptable406 = call('not acceptable', 406);
    proxyAuthenticationRequired407 = call('proxy authentication required', 407);
    requestTimeout408 = call('request timeout', 408);
    conflict409 = call('conflict', 409);
    gone410 = call('gone', 410);
    lengthRequired411 = call('length required', 411);
    preconditionFailed412 = call('precondition failed', 412);
    payloadTooLarge413 = call('payload too large', 413);
    uriTooLong414 = call('uri too long', 414);
    unsupportedMediaType415 = call('unsupported media type', 415);
    rangeNotSatisfiable416 = call('range not satisfiable', 416);
    expectationFailed417 = call('expectation failed', 417);
    tooManyRequest429 = call('too many request', 429);
    clientCloseRequest499 = call('client close request', 499);
  }

  void _build500x() {
    internalServerError500 = call('internal server error', 500);
    notImplemented501 = call('not implemented', 501);
    badGateway502 = call('bad gateway', 502);
    serviceUnavailable503 = call('service unavailable', 503);
    gatewayTimeout504 = call('gateway timeout', 504);
    httpVersionNotSupported505 = call('httpVersionNotSupported', 505);
  }
}
