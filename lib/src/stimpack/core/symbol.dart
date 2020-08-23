part of g3.stimpack.core;

// region Symbol

class Symbol extends Expr<Symbol> {
  Symbol(SymbolScope scope) : super(scope);
}

class SymbolScope extends Scope<Symbol> {
  @override
  Symbol make() => Symbol(this);

  Symbol call(String name) {
    return add(name);
  }
}

// endregion
