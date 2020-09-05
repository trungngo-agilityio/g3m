part of g3.stimpack.model;

typedef StimModelWalkerFunc = bool Function(
    StimModelWalkContext context, dynamic node);

class StimModelWalkContext {
  /// The internal list of processed symbols.
  /// This set helps to never visit a symbol twice.
  final Set _processed;

  final Queue<StimModelSymbol> _stack;

  /// The stack of visited symbols.
  /// This help handler to discover all contextual data
  /// related to the currently processed symbol.
  ///
  List<StimModelSymbol> get stack => List.unmodifiable(_stack);

  T firstOfType<T>() {
    return _stack.firstWhere(
      (element) => element is T,
      orElse: () => null,
    ) as T;
  }

  StimModelWalkContext._([Queue stack, Set processed])
      : _processed = processed ?? {},
        _stack = stack ?? Queue();
}

class StimModelWalker {
  final Map<StimModelType, StimModelWalkerFunc> _handler;

  StimModelWalker([Map<StimModelType, StimModelWalkerFunc> handler])
      : _handler = handler ?? {};

  StimModelWalker on({
    @meta.required StimModelType type,
    @meta.required StimModelWalkerFunc exec,
  }) {
    assert(type != null, 'on is required');
    assert(exec != null, 'exec is required');
    _handler[type] = exec;
    return this;
  }

  void walk({
    @meta.required StimModelType type,
    @meta.required dynamic instance,
  }) {
    assert(type != null, 'type is required');
    final context = StimModelWalkContext._();
    _doWalk(context, type, instance);
  }

  void _doWalk(
      StimModelWalkContext context, StimModelType type, dynamic symbol) {

    // Quits if the symbol has been visited.
    if (symbol == null || context._processed.contains(symbol)) return;

    context._processed.add(symbol);

    final r = reflect(symbol);

    if (type.isCollection) {
      // Special dart collection type that can be iterate through.
      final iterable = symbol as Iterable;
      for (final i in iterable) {
        _doWalk(context, type.item, i);
      }
      return;
    }

    // Adds the symbol to the stack
    context._stack.addFirst(symbol);

    final func = _handler[type];
    if (func != null) {
      // Done walking
      if (func.call(context, symbol) == true) return;
    }

    if (type.fields?.isNotEmpty == true) {
      for (final f in type.fields) {
        var fieldName = Symbol(f.name.camel().toString());
        final fieldValue = r.getField(fieldName).reflectee;

        if (fieldValue != null) {
          _doWalk(context, f.type, fieldValue);
        }
      }
    }

    // Removes the symbol from the stack
    context._stack.removeFirst();
  }
}
