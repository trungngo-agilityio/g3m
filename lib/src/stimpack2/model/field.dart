part of g3.stimpack2.model;

class StimModelFieldScope {
  StimModelField length;

  StimModelField of({
    @meta.required dynamic name,
    Set<StimModelTag> tags,
    @meta.required StimModelType type,
    Set<StimModelFieldRule> rules,
  }) {
    return StimModelField()
      ..name = StimName.of(name)
      ..tags = tags
      ..type = type
      ..rules = rules;
  }

  StimModelField listOf({
    dynamic name,
    Set<StimModelTag> tags,
    @meta.required StimModelType type,
    Set<StimModelFieldRule> rules,
  }) {
    return of(
      name: name,
      tags: tags,
      type: stimpack.model.type.listOf(package: null, fields: null, item: type),
      rules: rules,
    );
  }

  StimModelField setOf({
    dynamic name,
    Set<StimModelTag> tags,
    @meta.required StimModelType type,
    Set<StimModelFieldRule> rules,
  }) {
    return of(
      name: name,
      tags: tags,
      type: stimpack.model.type.setOf(package: null, fields: null, item: type),
      rules: rules,
    );
  }
}

class StimModelField extends StimModelSymbol<StimModelField> {
  // The data type that this field has.
  StimModelType type;

  /// The list of validation rules applied to this data field.
  Set<StimModelFieldRule> rules;

  bool get isRequired => rules?.contains(stimpack.model.rule.required);

  bool get isUnique => rules?.contains(stimpack.model.rule.unique);

  StimModelField required() => clone()..rules += stimpack.model.rule.required;

  StimModelField unique() => clone()..rules += stimpack.model.rule.unique;

  StimModelField();
}
