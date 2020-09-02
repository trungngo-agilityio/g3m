part of g3.stimpack2.meta;

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
  StimMetaPackRef _ref;

  /// Gets the reference to this model.
  StimMetaPack get ref => _ref ??= StimMetaPackRef()..symbol = this;

  StimMetaPack();
}

class StimMetaPackRef extends StimSymbolRef<StimMetaPack>
    implements StimMetaPack {}
