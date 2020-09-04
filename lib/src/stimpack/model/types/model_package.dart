part of g3.stimpack.model;

class StimModelPackageScope {
  StimModelPackage dart;
  StimModelPackage model;

  StimModelPackage of({@meta.required dynamic name, Set<StimModelTag> tags}) {
    return StimModelPackage()
      ..name = StimName.of(name)
      ..types = {}
      ..tags = tags ?? {};
  }
}

class StimModelPackage extends StimModelSymbol<StimModelPackage> {
  Set<StimModelType> types;

  /// Gets the reference to this model.
  StimModelPackage ref() => StimModelPackageRef()..symbol = this;

  StimModelPackage();
}

class StimModelPackageRef extends StimSymbolRef<StimModelPackage>
    implements StimModelPackage {}
