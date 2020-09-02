part of g3.stimpack2.model;

class StimModelHttpStatusScope {
  Set<StimModelHttpStatus> x200;
  StimModelHttpStatus ok200,
      created201,
      accepted202,
      nonAuthoritativeInfo203,
      noContent204;

  Set<StimModelHttpStatus> x300;
  StimModelHttpStatus multipleChoices300,
      movedPermanently301,
      found302,
      seeOther303,
      notModified304,
      useProxy305,
      switchProxy306,
      temporarilyRedirected307,
      permanentRedirected308;

  Set<StimModelHttpStatus> x400;
  StimModelHttpStatus badRequest400,
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

  Set<StimModelHttpStatus> x500;
  StimModelHttpStatus internalServerError500,
      notImplemented501,
      badGateway502,
      serviceUnavailable503,
      gatewayTimeout504,
      httpVersionNotSupported505;

  StimModelHttpStatus of({
    @meta.required dynamic name,
    @meta.required int code,
    Set<StimModelTag> tags,
  }) =>
      StimModelHttpStatus()
        ..name = StimName.of(name)
        ..code = code
        ..tags = tags;
}

class StimModelHttpStatus extends StimModelSymbol<StimModelHttpStatus> {
  int code;

  StimModelHttpStatusRef _ref;

  /// Gets the reference to this model.
  StimModelHttpStatus get ref =>
      _ref ??= StimModelHttpStatusRef()..symbol = this;

  StimModelHttpStatus();
}

class StimModelHttpStatusRef extends StimSymbolRef<StimModelHttpStatus>
    implements StimModelHttpStatus {}
