part of g3.stimpack.core;

class HttpStatus extends Expr<HttpStatus> {
  int _code;

  int get code => _code;

  set code(int value) {
    assert(value != null);
    for (var i in eval()) {
      i._code = value;
    }
  }

  bool get isSuccess200X => code >= 200 && code < 300;

  bool get isRedirection300X => code >= 300 && code < 400;

  bool get isClientError400X => code >= 400 && code < 500;

  bool get isServerError500X => code >= 500 && code < 600;

  HttpStatus(HttpStatusScope scope) : super(scope);
}

class HttpStatusScope extends Scope<HttpStatus> {
  @override
  HttpStatus make() {
    return HttpStatus(this);
  }

  HttpStatus call(String name, int code) {
    return add(name).._code = code;
  }
}
