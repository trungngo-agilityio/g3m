part of g3.stimpack.faker.init;

extension OnStimModelPackageFakerExtension on StimModelPackage {
  /// Initializes the default faker for the type.
  /// By default, the faker [name] is computed with the type name
  /// and some suffix/prefix depending on the faker configuration.
  StimFakerPackage fake({dynamic name, Set<StimModelTag> tags}) {
    final res = stimpack.faker.package.of(
      name: name ?? StimName.refOf(this),
      package: this,
      tags: tags,
    );

    fakers += {res};

    return res;
  }

  /// Gets the default faker for the package. It should be
  /// the first faker registered for the faker list.
  StimFakerPackage get defaultFaker =>
      firstValueOfTypeTag<Set<StimFakerPackage>>()?.first;

  /// Gets the list of faker for the package
  Set<StimFakerPackage> get fakers =>
      firstValueOfTypeTag<Set<StimFakerPackage>>();

  /// Sets the list of faker for the package
  set fakers(Set<StimFakerPackage> values) => setValueAsTypeTag(values);
}
