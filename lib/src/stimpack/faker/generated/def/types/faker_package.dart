part of g3.stimpack.faker.generated;



/// The package contains different fakers
class StimFakerPackage extends StimModelSymbol<StimFakerPackage> {
  /// The common prefix for all generated code
  String prefix;

  /// The package that this faker is for.
  StimModelPackage package;

  /// The set of all type fakers in the package.
  Set<StimModelType> types;

  /// The global configuration applied to the package
  StimFakerConfig config;

  StimFakerPackage();


  /// Creates a new "package" of [StimFakerPackage] type.
  StimFakerPackage copyWith({@required
  dynamic name, String prefix, StimModelPackage package, Set<StimModelType> types, StimFakerConfig config, Set<StimModelTag> tags}) {
    return StimFakerPackage()
        ..name = StimName.of(name ?? this.name)
        ..prefix = prefix ?? this.prefix
        ..package = package ?? this.package
        ..types = types ?? this.types
        ..config = config ?? this.config
        ..tags = tags ?? this.tags;
  }
}


class StimFakerPackageScope {
  /// Creates a new "package" of [StimFakerPackage] type.
  StimFakerPackage of({@required
  dynamic name, String prefix, StimModelPackage package, Set<StimModelType> types, StimFakerConfig config, Set<StimModelTag> tags}) {
    return StimFakerPackage()
        ..name = StimName.of(name)
        ..prefix = prefix
        ..package = package
        ..types = types ?? {}
        ..config = config
        ..tags = tags ?? {};
  }
}
