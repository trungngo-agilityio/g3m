part of g3.stimpack.faker.init;

extension OnStimModelTypeFakerExtension on StimModelType {
  /// Initializes the default faker for the type.
  StimFakerType fake({
    dynamic name,
    Set<StimModelField> params,
    Set<StimModelTag> tags,
  }) {
    var packageFaker = package?.defaultFaker;
    if (package != null && packageFaker == null) {
      // Creates a default field type faker
      packageFaker = package.fake();
      printWarn(
          'Package "${package.name}"\'s faker should be set up before type\'s "${name}" faker.');
    }

    return stimpack.faker.type.of(
      name: name ?? StimName.refOf(this),
      type: this,
      package: packageFaker,
      params: params,
      tags: tags,
    );
  }

  /// Gets the default faker for the type. It should be
  /// the first faker registered for the faker list.
  StimFakerType get defaultFaker =>
      firstValueOfTypeTag<Set<StimFakerType>>()?.first;

  /// Gets the list of fakers registered on the type.
  /// These would includes the [defaultFaker] and all of those registered
  /// via any [StimModelField] that has the [StimModelField.type] is this type.
  Set<StimFakerType> get fakers => firstValueOfTypeTag<Set<StimFakerType>>();

  /// Sets the list of fakers registered on this type.
  set fakers(Set<StimFakerType> values) => setValueAsTypeTag(values);
}
