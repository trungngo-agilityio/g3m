part of g3m.core;

class RestApiController extends Expr<RestApiController> {
  Model _model;

  RestApiCreate _apiCreate;

  RestApiController(RestApiControllerScope scope) : super(scope);
}

class RestApiControllerScope extends Scope<RestApiController> {
  final ModelScope _model;
  final RestApiCreateScope _apiCreate;

  RestApiControllerScope(this._model, this._apiCreate);

  @override
  RestApiController make() {
    throw RestApiController(this);
  }

  RestApiController call(dynamic name) {
    return add(name)
      .._model = _model.none
      .._apiCreate = _apiCreate.none;
  }

  RestApiController byModel(Model model) {
    assert(model != null);
    return call(model.name).._model = model;
  }
}
