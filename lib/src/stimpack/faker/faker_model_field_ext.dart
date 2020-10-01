part of g3.stimpack.faker.init;

extension OnStimModelFieldFakerExtension on StimModelField {
  StimFakerField fake({
    dynamic name,
    Set<StimModelTag> tags,
  }) {
    assert(type != null, 'field type is required');

    // Gets out the default faker for the field type
    var fieldTypeFaker = type.defaultFaker;

    if (fieldTypeFaker == null) {
      // Creates a default field type faker
      fieldTypeFaker = type.fake();
      printWarn(
          'Type "${type.name}"\'s faker should be set up before field\'s "${name}" faker.');
    }

    // Creates a new field faker.
    final fieldFaker = stimpack.faker.field.of(
      name: name ?? StimName.refOf(this),
      field: this,
      type: fieldTypeFaker,
      tags: tags,
    );

    /// Adds the field to faker.
    fieldTypeFaker.fields.add(fieldFaker);

    return fieldFaker;
  }

  /// Gets the default faker for the field, which is either the
  /// registered [customFaker] for the field, or the default faker
  /// from the field type.
  StimFakerField get defaultFaker => customFaker ?? type?.defaultFaker;

  /// Gets the default faker for the field.
  StimFakerField get customFaker => firstValueOfTypeTag<StimFakerField>();

  /// Sets the default faker for the field.
  set customFaker(StimFakerField value) => setValueAsTypeTag(value);
}
