part of g3.stimpack.model;

class StimModelSymbol<T extends StimModelSymbol<T>> extends StimSymbol<T>
    implements StimNamed {
  /// All model symbol should have a name.
  @override
  StimName name;

  /// All things in the models should have tags.
  Set<StimModelTag> tags;

  StimModelSymbol();

  StimModelSymbol.of(this.name, {this.tags});
}
