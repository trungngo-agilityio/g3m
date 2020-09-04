part of g3.stimpack.angular.generated;

class StimAngularResolver extends StimModelSymbol<StimAngularResolver> {
  StimAngularResolver();

  StimAngularResolver ref() {
    return StimAngularResolverRef()..symbol = this;
  }

  /// Creates a new "resolver" of [StimAngularResolver] type.
  StimAngularResolver refWith({dynamic name, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}

class StimAngularResolverRef extends StimSymbolRef<StimAngularResolver>
    implements StimAngularResolver {}

class StimAngularResolverScope {
  /// Creates a new "resolver" of [StimAngularResolver] type.
  StimAngularResolver of({dynamic name, Set<StimModelTag> tags}) {
    return StimAngularResolver()
      ..name = StimName.of(name)
      ..tags = tags ?? {};
  }
}
