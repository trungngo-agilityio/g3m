part of g3m.core;

class RestApiCreate extends Expr<RestApiCreate> {
  Model _model;

  RestApiCreate(RestApiCreateScope scope) : super(scope);
}

class RestApiCreateScope extends Scope<RestApiCreate> {
  @override
  RestApiCreate make() {
    throw RestApiCreate(this);
  }

  RestApiCreate call(dynamic name) {
    return add(name);
  }

  RestApiCreate byModel(Model model) {
    return call(model.name).._model = model;
  }
}
