part of g3.stimpack2.model;

class StimModelSymbol<T extends StimModelSymbol<T>> extends StimSymbol<T> {
  /// All model symbol should have a name.
  StimName name;

  /// All things in the models should have tags.
  Set<StimModelTag> tags;

  StimModelSymbol();

  StimModelSymbol.of(this.name, {this.tags});
}
