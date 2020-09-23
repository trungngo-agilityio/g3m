part of g3.stimpack.angular.generated;



class StimAngularService extends StimModelSymbol<StimAngularService> {
  StimAngularService();


  /// Creates a new "service" of [StimAngularService] type.
  StimAngularService copyWith({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularService()
        ..name = StimName.of(name ?? this.name)
        ..tags = tags ?? this.tags;
  }
}


class StimAngularServiceScope {
  /// Creates a new "service" of [StimAngularService] type.
  StimAngularService of({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularService()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
