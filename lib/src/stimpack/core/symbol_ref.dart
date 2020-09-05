part of g3.stimpack.core;

class StimSymbolRef<T> {
  T symbol;
  InstanceMirror _im;

  Map<String, dynamic> _values;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (symbol == null) return null;
    var key = invocation.memberName.toString();
    if (invocation.isGetter) {
      // Try to checks if this values is overwritten before.
      if (_values != null && _values.containsKey(key)) {
        return _values[key];
      }
    } else if (invocation.isSetter) {
      // This value is overwritten
      final value = invocation.positionalArguments.first;

      // Removes the extra character '=' from the symbol.
      // Notes: The getter symbol is Symbol("aField"),
      // while the setter symbol is Symbol("aField=")
      assert(key.contains('='), 'BUG. Review this.');
      key = key.replaceAll('=', '');

      assert(value != null, 'BUG. Review this magic code');
      _values ??= {};
      _values[key] = value;
      return value;
    }

    _im ??= reflect(symbol);
    final res = _im.delegate(invocation);

    return res;
  }
}
