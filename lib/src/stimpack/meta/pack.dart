part of g3.stimpack.meta;

class StimMetaPackScope {
  StimMetaPack of({
    @required dynamic name,
    StimModelType types,
    Set<StimModelTag> tags,
  }) =>
      StimMetaPack()
        ..name = StimName.of(name)
        ..types = types
        ..tags = tags;
}

class StimMetaPack extends StimModelSymbol<StimMetaPack> {
  StimModelType types;

  StimMetaPack();
}
