part of g3.stimpack.angular.generated;



class StimAngularGuard extends StimModelSymbol<StimAngularGuard> {
  StimAngularGuard();


  /// Creates a new "guard" of [StimAngularGuard] type.
  StimAngularGuard copyWith({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularGuard()
        ..name = StimName.of(name ?? this.name)
        ..tags = tags ?? this.tags;
  }
}


class StimAngularGuardScope {
  /// Creates a new "guard" of [StimAngularGuard] type.
  StimAngularGuard of({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularGuard()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
