part of g3.stimpack.model;

typedef StimModelWalkerFunc<T extends StimSymbol<T>> = bool Function(
    StimModelWalkContext context, T node);

class StimModelWalkContext {
  final Set processed;

  StimModelWalkContext() : processed = {};
}

class StimModelWalker {
  final Map<StimModelType, StimModelWalkerFunc> _handler;

  StimModelWalker(this._handler) : assert(_handler != null);

  // void on<T extends StimSymbol<T>>(StimModelWalkerFunc<T> handler) {
  //   final type = reflectType(T).reflectedType;
  //   final modelType = stimpack.model.type.fromDart(type);
  //   _handler[modelType] = handler;
  // }

  void walk(StimModelType type, dynamic symbol) {
    _doWalk(StimModelWalkContext(), type, symbol);
  }

  void _doWalk(
      StimModelWalkContext context, StimModelType type, dynamic symbol) {
    if (symbol == null || context.processed.contains(symbol)) return;
    context.processed.add(symbol);
    final func = _handler[type];
    if (func != null) {
      // Done walking
      if (func.call(context, symbol) == true) return;
    }

    final r = reflect(symbol);
    final t = stimpack.model.type;

    if (type == t.set || type == t.list) {
      final iterable = symbol as Iterable;
      for (final i in iterable) {
        _doWalk(context, type.item, i);
      }
    } else if (type.fields?.isNotEmpty == true) {
      for (final f in type.fields) {
        var fieldName = Symbol(f.name.camel().toString());
        final fieldValue = r.getField(fieldName).reflectee;
        if (fieldValue != null) {
          _doWalk(context, f.type, fieldValue);
        }
      }
    }
  }
}
