part of g3.stimpack2.model;

class StimModelPackageScope {
  StimModelPackage dart;

  StimModelPackage of({@meta.required dynamic name, Set<StimModelTag> tags}) {
    return StimModelPackage()
      ..name = StimName.of(name)
      ..tags = tags;
  }
}

class StimModelPackage extends StimModelSymbol<StimModelPackage> {
  Set<StimModelType> types;

  StimModelPackageRef _ref;

  /// Gets the reference to this model.
  StimModelPackage get ref => _ref ??= StimModelPackageRef()..symbol = this;

  StimModelPackage();
}

class StimModelPackageRef extends StimSymbolRef<StimModelPackage>
    implements StimModelPackage {}
