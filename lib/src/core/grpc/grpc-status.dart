/// See https://gist.github.com/hamakn/708b9802ca845eb59f3975dbb3ae2a01
/// and https://grpc.io/docs/languages/go/generated-code/
///

part of g3m.core;

class GRpcStatus extends Expr<GRpcStatus> {
  int _code;

  int get code => _code;

  set code(int value) {
    assert(value != null);
    for (var i in eval()) {
      i._code = value;
    }
  }

  HttpStatus _httpStatus;

  HttpStatus get httpStatus => _httpStatus;

  set httpStatus(HttpStatus value) {
    for (var i in eval()) {
      i._httpStatus = value;
    }
  }

  bool get isSuccess => _httpStatus?.isSuccess200X == true;

  bool get isRedirection => _httpStatus?.isRedirection300X == true;

  bool get isClientError => _httpStatus?.isClientError400X == true;

  bool get isServerError => _httpStatus?.isServerError500X == true;

  GRpcStatus(GRpcStatusScope scope) : super(scope);
}

class GRpcStatusScope extends Scope<GRpcStatus> {
  @override
  GRpcStatus make() {
    return GRpcStatus(this);
  }

  GRpcStatus call(String name, int code, HttpStatus httpStatus) {
    return add(name)
      .._code = code
      .._httpStatus = httpStatus;
  }
}
