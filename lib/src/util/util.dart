part of g3.util;

mixin Proxy {
  Object internal;
  InstanceMirror _im;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    assert(internal != null, 'internal must be set up');
    _im ??= reflect(internal);
    return _im.delegate(invocation);
  }
}

extension ObjectExt<T> on T {
  R let<R>(R Function(T that) op) => op(this);
}
