part of g3.stimpack.angular.generated;



class StimAngularResolver extends StimModelSymbol<StimAngularResolver> {
  StimAngularResolver();


  /// Creates a new "resolver" of [StimAngularResolver] type.
  StimAngularResolver copyWith({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularResolver()
        ..name = StimName.of(name ?? this.name)
        ..tags = tags ?? this.tags;
  }
}


class StimAngularResolverScope {
  /// Creates a new "resolver" of [StimAngularResolver] type.
  StimAngularResolver of({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularResolver()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
