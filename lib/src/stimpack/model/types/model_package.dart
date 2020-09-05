part of g3.stimpack.model;

class StimModelPackageScope {
  StimModelPackage model;

  Map<DeclarationMirror, StimModelPackage> _dartPackages;

  StimModelPackage of({@meta.required dynamic name, Set<StimModelTag> tags}) {
    return StimModelPackage()
      ..name = StimName.of(name)
      ..types = {}
      ..tags = tags ?? {};
  }

  /// Creates a new package from a dart library.
  /// This implementation shall make sure only 1 instance of
  /// [StimModelPackage] is created for a [library].
  StimModelPackage fromDart(LibraryMirror library) {
    _dartPackages ??= {};
    var package = _dartPackages[library];

    // Only creates one instance of a dart package.
    if (package != null) return package;
    _dartPackages[library] = package = StimModelPackage()
      ..name = StimName.of(library.qualifiedName)
      ..dartLibrary = library;

    return package;
  }
}

class StimModelPackage extends StimModelSymbol<StimModelPackage> {
  Set<StimModelType> types;

  /// This instance is only not null when the library come
  /// from a dart library.
  LibraryMirror dartLibrary;

  bool get isDart => dartLibrary != null;

  /// Gets the reference to this model.
  StimModelPackage ref() => StimModelPackageRef()..symbol = this;

  StimModelPackage();
}

class StimModelPackageRef extends StimSymbolRef<StimModelPackage>
    implements StimModelPackage {}
