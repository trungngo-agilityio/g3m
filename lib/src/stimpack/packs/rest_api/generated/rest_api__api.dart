part of g3.stimpack.rest_api.generated;

class StimRestApiApi extends StimSymbol<StimRestApiApi, StimRestApiApiSet> {
  StimModelTypeSet request;

  StimModelFieldSet response;

  StimRbacAccessGrant required;

  StimRestApiApi(_StimRestApiApiScopeImpl scope) : super(scope);

  @override
  StimRestApiApi clone() {
    return super.clone()
      ..request = request.clone()
      ..response = response.clone()
      ..required = required.clone();
  }
}

class StimRestApiApiSet
    extends StimSymbolSet<StimRestApiApi, StimRestApiApiSet> {
  final _StimRestApiApiScopeImpl _scope;

  StimRestApiApiXRequestSetOp _request;

  StimRestApiApiXResponseSetOp _response;

  StimRestApiApiXRequiredOp _required;

  StimRestApiApiXRequestSetOp get request {
    return _request ??= StimRestApiApiXRequestSetOp(this, stimpack.model.type);
  }

  set request(StimRestApiApiXRequestSetOp value) {
    _request = value;
  }

  StimRestApiApiXResponseSetOp get response {
    return _response ??=
        StimRestApiApiXResponseSetOp(this, stimpack.model.field);
  }

  set response(StimRestApiApiXResponseSetOp value) {
    _response = value;
  }

  StimRestApiApiXRequiredOp get required {
    return _required ??=
        StimRestApiApiXRequiredOp(this, stimpack.rbac.accessGrant);
  }

  set required(StimRestApiApiXRequiredOp value) {
    _required = value;
  }

  StimRestApiApiSet(this._scope, List<StimRestApiApi> items)
      : super(_scope, items);
}

abstract class StimRestApiApiScope
    extends StimScope<StimRestApiApi, StimRestApiApiSet> {
  StimRestApiApi of(name,
      {dynamic request, dynamic response, dynamic required});
}

class _StimRestApiApiScopeImpl
    extends StimScopeImpl<StimRestApiApi, StimRestApiApiSet>
    implements StimRestApiApiScope {
  StimModelTypeSet request;

  StimModelFieldSet response;

  StimRbacAccessGrant required;

  _StimRestApiApiScopeImpl() : super();

  @override
  StimRestApiApi of(name,
      {dynamic request, dynamic response, dynamic required}) {
    return createAndClear(name)
      ..request += request ?? stimpack.model.type.noneSet
      ..response += response ?? stimpack.model.field.noneSet
      ..required = required ?? stimpack.rbac.accessGrant.none;
  }

  @override
  void clear(StimRestApiApi symbol) {
    symbol
      ..request = stimpack.model.type.noneSet
      ..response = stimpack.model.field.noneSet
      ..required = stimpack.rbac.accessGrant.none;
  }

  @override
  StimRestApiApi create() {
    return StimRestApiApi(this);
  }

  @override
  StimRestApiApiSet createSet(List<StimRestApiApi> items) {
    return StimRestApiApiSet(this, items);
  }
}
