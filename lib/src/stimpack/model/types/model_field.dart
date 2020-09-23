part of g3.stimpack.model;

class StimModelFields {
  StimModelField autoStringId;
  StimModelField stringId;
  StimModelField intId;
  StimModelField autoIntId;
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
    Set<StimModelFilter> filters,
  }) {
    return StimModelField()
      ..name = StimName.of(name)
      ..type = type
      ..rules = rules
      ..filters = filters
      ..tags = tags;
  }

  StimModelField listOf({
    dynamic name,
    Set<StimModelTag> tags,
    @meta.required StimModelType type,
    Set<StimModelFieldRule> rules,
    Set<StimModelFilter> filters,
  }) {
    assert(type != null, 'type is required');
    return of(
      name: name,
      type: stimpack.model.type.listOf(item: type),
      rules: rules,
      filters: filters,
      tags: tags,
    );
  }

  StimModelField setOf({
    dynamic name,
    Set<StimModelTag> tags,
    @meta.required StimModelType type,
    Set<StimModelFieldRule> rules,
    Set<StimModelFilter> filters,
  }) {
    return of(
      name: name,
      type: stimpack.model.type.setOf(item: type),
      rules: rules,
      filters: filters,
      tags: tags,
    );
  }
}

class StimModelField extends StimModelSymbol<StimModelField> {
  // The data type that this field has.
  StimModelType type;

  /// The list of validation rules applied to this data field.
  Set<StimModelFieldRule> rules;

  /// The list of filters applied to this data field.
  /// Notes that [indexed] function shall add predefined set of
  /// filters to the field, given the field type.
  Set<StimModelFilter> filters;

  /// Determines if the field is required or not.
  bool get isRequired => rules?.contains(stimpack.model.rule.required) == true;

  /// Determines if the field is readonly or not.
  bool get isReadOnly => rules?.contains(stimpack.model.rule.readOnly) == true;

  /// Determines if the field is write only or not.
  bool get isWriteOnly =>
      rules?.contains(stimpack.model.rule.writeOnly) == true;

  /// Determines if the field is system only or not.
  bool get isSystemOnly =>
      rules?.contains(stimpack.model.rule.systemOnly) == true;

  /// Determines if the field is transient or not.
  bool get isTransient =>
      rules?.contains(stimpack.model.rule.transient) == true;

  /// Determines if a field is unique or not.
  bool get isUnique => rules?.contains(stimpack.model.rule.unique) == true;

  /// Determines if a field is indexed or not.
  bool get isIndexed => rules?.contains(stimpack.model.rule.indexed) == true;

  /// Marks that a field is required.
  void required() => rules += stimpack.model.rule.required;

  /// Marks that a field should be indexed so that database queries can
  /// be applied to the field.
  void indexed() => rules += _model.rule.indexed;

  /// Marks that this is a restricted field. It should be a target
  /// for role based access checking.
  void authorized() => rules += stimpack.model.rule.authorized;

  /// Marks that whenever a field is returned, it is readonly.
  /// in the case of apis development, this field should not
  /// be send in any request body. For instance, the id field
  /// is read only for update api.
  void readOnly() => rules += stimpack.model.rule.readOnly;

  /// Marks that this field is a write only field. An example,
  /// a field password might a write only field.
  void writeOnly() => rules += stimpack.model.rule.writeOnly;

  /// Marks that this field is a system field. It will not be readable
  /// by users or external systems
  void systemOnly() => rules += stimpack.model.rule.systemOnly;

  /// Marks that the field is transient and should not be persisted
  void transient() => rules += stimpack.model.rule.transient;

  // Marks a field should unique.
  void unique() => rules += stimpack.model.rule.unique;

  StimModelField copyWith({
    dynamic name,
    Set<StimModelTag> tags,
    StimModelType type,
    Set<StimModelFieldRule> rules,
    Set<StimModelFilter> filters,
  }) {
    return StimModelField()
      ..name = StimName.of(name ?? this.name)
      ..type = type ?? this.type
      ..rules = rules ?? this.rules
      ..filters = filters ?? this.filters
      ..tags = tags ?? this.tags;
  }
}
