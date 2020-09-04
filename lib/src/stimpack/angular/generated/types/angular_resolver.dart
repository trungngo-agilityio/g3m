part of g3.stimpack.angular.generated;



class StimAngularResolver extends StimModelSymbol<StimAngularResolver> {
  StimAngularResolverRef _ref;

  StimAngularResolverRef get ref {
    return _ref ??= StimAngularResolverRef();
  }
  StimAngularResolver();
}


class StimAngularResolverRef extends StimSymbolRef<StimAngularResolver> implements StimAngularResolver {

}


class StimAngularResolverScope {
  /// Creates a new "resolver" of [StimAngularResolver] type.
  StimAngularResolver of({dynamic name, Set<StimModelTag> tags}) {
    return StimAngularResolver()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
