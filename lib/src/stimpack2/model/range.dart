part of g3.stimpack2.model;

class StimModelRangeScope {}

class StimModelRange extends StimModelSymbol<StimModelRange> {
  num min;
  num max;

  StimModelRangeRef _ref;

  /// Gets the reference to this model.
  StimModelRange get ref => _ref ??= StimModelRangeRef()..symbol = this;

  StimModelRange();
}

class StimModelRangeRef extends StimSymbolRef<StimModelRange>
    implements StimModelRange {}
