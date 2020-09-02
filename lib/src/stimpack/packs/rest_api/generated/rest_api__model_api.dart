part of g3.stimpack.rest_api.generated;

class StimRestApiModelApi
    extends StimSymbol<StimRestApiModelApi, StimRestApiModelApiSet> {
  StimModelType model;

  StimModelField idField;

  StimModelTypeSet request;

  StimModelFieldSet response;

  StimRestApiModelApiKindSet apis;

  StimRbacAccessGrant required;

  StimRestApiModelApi(_StimRestApiModelApiScopeImpl scope) : super(scope);

  @override
  StimRestApiModelApi clone() {
    return super.clone()
      ..model = model.clone()
      ..idField = idField.clone()
      ..request = request.clone()
      ..response = response.clone()
      ..apis = apis.clone()
      ..required = required.clone();
  }
}

class StimRestApiModelApiSet
    extends StimSymbolSet<StimRestApiModelApi, StimRestApiModelApiSet> {
  final _StimRestApiModelApiScopeImpl _scope;

  StimRestApiModelApiXModelOp _model;

  StimRestApiModelApiXIdFieldOp _idField;

  StimRestApiModelApiXRequestSetOp _request;

  StimRestApiModelApiXResponseSetOp _response;

  StimRestApiModelApiXApisSetOp _apis;

  StimRestApiModelApiXRequiredOp _required;

  StimRestApiModelApiXModelOp get model {
    return _model ??= StimRestApiModelApiXModelOp(this, stimpack.model.type);
  }

  set model(StimRestApiModelApiXModelOp value) {
    _model = value;
  }

  StimRestApiModelApiXIdFieldOp get idField {
    return _idField ??=
        StimRestApiModelApiXIdFieldOp(this, stimpack.model.field);
  }

  set idField(StimRestApiModelApiXIdFieldOp value) {
    _idField = value;
  }

  StimRestApiModelApiXRequestSetOp get request {
    return _request ??=
        StimRestApiModelApiXRequestSetOp(this, stimpack.model.type);
  }

  set request(StimRestApiModelApiXRequestSetOp value) {
    _request = value;
  }

  StimRestApiModelApiXResponseSetOp get response {
    return _response ??=
        StimRestApiModelApiXResponseSetOp(this, stimpack.model.field);
  }

  set response(StimRestApiModelApiXResponseSetOp value) {
    _response = value;
  }

  StimRestApiModelApiXApisSetOp get apis {
    return _apis ??=
        StimRestApiModelApiXApisSetOp(this, stimpack.restApi.modelApiKind);
  }

  set apis(StimRestApiModelApiXApisSetOp value) {
    _apis = value;
  }

  StimRestApiModelApiXRequiredOp get required {
    return _required ??=
        StimRestApiModelApiXRequiredOp(this, stimpack.rbac.accessGrant);
  }

  set required(StimRestApiModelApiXRequiredOp value) {
    _required = value;
  }

  StimRestApiModelApiSet(this._scope, List<StimRestApiModelApi> items)
      : super(_scope, items);
}

abstract class StimRestApiModelApiScope
    extends StimScope<StimRestApiModelApi, StimRestApiModelApiSet> {
  StimRestApiModelApi of(name,
      {dynamic model,
      dynamic idField,
      dynamic request,
      dynamic response,
      dynamic apis,
      dynamic required});
}

class _StimRestApiModelApiScopeImpl
    extends StimScopeImpl<StimRestApiModelApi, StimRestApiModelApiSet>
    implements StimRestApiModelApiScope {
  StimModelType model;

  StimModelField idField;

  StimModelTypeSet request;

  StimModelFieldSet response;

  StimRestApiModelApiKindSet apis;

  StimRbacAccessGrant required;

  _StimRestApiModelApiScopeImpl() : super();

  @override
  StimRestApiModelApi of(name,
      {dynamic model,
      dynamic idField,
      dynamic request,
      dynamic response,
      dynamic apis,
      dynamic required}) {
    return createAndClear(name)
      ..model = model ?? stimpack.model.type.none
      ..idField = idField ?? stimpack.model.field.none
      ..request += request ?? stimpack.model.type.noneSet
      ..response += response ?? stimpack.model.field.noneSet
      ..apis += apis ?? stimpack.restApi.modelApiKind.noneSet
      ..required = required ?? stimpack.rbac.accessGrant.none;
  }

  @override
  void clear(StimRestApiModelApi symbol) {
    symbol
      ..model = stimpack.model.type.none
      ..idField = stimpack.model.field.none
      ..request = stimpack.model.type.noneSet
      ..response = stimpack.model.field.noneSet
      ..apis = stimpack.restApi.modelApiKind.noneSet
      ..required = stimpack.rbac.accessGrant.none;
  }

  @override
  StimRestApiModelApi create() {
    return StimRestApiModelApi(this);
  }

  @override
  StimRestApiModelApiSet createSet(List<StimRestApiModelApi> items) {
    return StimRestApiModelApiSet(this, items);
  }
}
