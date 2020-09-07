part of g3.stimpack.model;

class StimModelFields {
  StimModelField fieldSet;
}

class StimModelFieldScope {

  /// The model fields.
  StimModelFields model;

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
      type: stimpack.model.type.listOf(item: type),
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
      type: stimpack.model.type.setOf(item: type),
      rules: rules,
    );
  }
}

class StimModelField extends StimModelSymbol<StimModelField> {
  // The data type that this field has.
  StimModelType type;

  /// The list of validation rules applied to this data field.
  Set<StimModelFieldRule> rules;

  bool get isRequired => rules?.contains(stimpack.model.rule.required) == true;

  bool get isUnique => rules?.contains(stimpack.model.rule.unique) == true;

  bool get isReadOnly => rules?.contains(stimpack.model.rule.readOnly) == true;

  bool get isWriteOnly =>
      rules?.contains(stimpack.model.rule.writeOnly) == true;

  StimModelField required() => this..rules += stimpack.model.rule.required;

  StimModelField unique() => this..rules += stimpack.model.rule.unique;

  StimModelField writeOnly() => this..rules += stimpack.model.rule.writeOnly;

  StimModelField readOnly() => this..rules += stimpack.model.rule.readOnly;

  /// Gets the reference to this model.
  StimModelField ref() => StimModelFieldRef()..symbol = this;

  StimModelField refWith({
    dynamic name,
    Set<StimModelTag> tags,
    StimModelType type,
    Set<StimModelFieldRule> rules,
  }) {
    final res = ref();
    if (name != null) res.name = StimName.of(name);
    if (tags != null) res.tags = tags;
    if (type != null) res.type = type;
    if (rules != null) res.rules = rules;
    return res;
  }

  StimModelField();
}

class StimModelFieldRef extends StimSymbolRef<StimModelField>
    implements StimModelField {}
