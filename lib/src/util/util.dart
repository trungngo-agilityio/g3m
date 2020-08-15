part of g3.util;

mixin Proxy {
  Object _internal;
  InstanceMirror _im;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    _im ??= reflect(_internal);
    return _im.delegate(invocation);
  }
}

extension ObjectExt<T> on T {
  R let<R>(R Function(T that) op) => op(this);
}
