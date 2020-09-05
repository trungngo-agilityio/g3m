part of g3.stimpack.core;

extension StimSymbolIterableExtension<T extends StimSymbol<T>> on Iterable<T> {
  _StimSymbolScanner toScanner() => _StimSymbolScanner(this);
}
