part of g3.stimpack.faker.generated;



/// The configuration for a faker set
class StimFakerConfig extends StimModelSymbol<StimFakerConfig> {
  StimFakerConfig();


  /// Creates a new "config" of [StimFakerConfig] type.
  StimFakerConfig copyWith({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimFakerConfig()
        ..name = StimName.of(name ?? this.name)
        ..tags = tags ?? this.tags;
  }
}


class StimFakerConfigScope {
  /// Creates a new "config" of [StimFakerConfig] type.
  StimFakerConfig of({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimFakerConfig()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
