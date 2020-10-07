part of g3.stimpack.faker.init;

extension OnStimModelFieldFakerExtension on StimModelField {
  /// Gets the default faker for the field, which is either the
  /// registered [customFaker] for the field, or the default faker
  /// from the field type.
  StimFakerType get faker =>
      firstValueOfTag<StimFakerType>(_fakerTagName) ?? type?.faker;

  set faker(StimFakerType faker) {
    if (faker == null) {
      removeAllTags(_fakerTagName);
    } else {
      assert(faker.type == null || type == faker.type, 'invalid faker type');
      setTag(name: _fakerTagName, value: faker);
    }
  }
}
