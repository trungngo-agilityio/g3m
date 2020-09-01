part of g3.stimpack2.model;

class StimModelFieldRuleScope {
  StimModelFieldRule unique, required;

  StimModelFieldRule of({
    @meta.required dynamic name,
    Set<StimModelTag> tags,
    Set<StimModelPattern> patterns,
    Set<StimModelRange> ranges,
  }) {
    return StimModelFieldRule()
      ..name = StimName.of(name)
      ..tags = tags
      ..patterns = patterns
      ..ranges = ranges;
  }
}

class StimModelFieldRule extends StimModelSymbol<StimModelFieldRule> {
  /// The list of validation patterns applied to this data field.
  Set<StimModelPattern> patterns;

  /// The list of validation data ranges applied to this data field.
  Set<StimModelRange> ranges;

  StimModelFieldRule();
}
