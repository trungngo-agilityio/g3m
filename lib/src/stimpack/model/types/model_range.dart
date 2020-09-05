part of g3.stimpack.model;

class StimModelRangeScope {}

class StimModelRange extends StimModelSymbol<StimModelRange> {
  num min;
  num max;

  /// Gets the reference to this model.
  StimModelRange ref() => StimModelRangeRef()..symbol = this;

  StimModelRange();
}

class StimModelRangeRef extends StimSymbolRef<StimModelRange>
    implements StimModelRange {}
