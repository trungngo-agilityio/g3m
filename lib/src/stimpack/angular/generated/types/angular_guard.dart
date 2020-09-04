part of g3.stimpack.angular.generated;



class StimAngularGuard extends StimModelSymbol<StimAngularGuard> {
  StimAngularGuardRef _ref;

  StimAngularGuardRef get ref {
    return _ref ??= StimAngularGuardRef();
  }
  StimAngularGuard();
}


class StimAngularGuardRef extends StimSymbolRef<StimAngularGuard> implements StimAngularGuard {

}


class StimAngularGuardScope {
  /// Creates a new "guard" of [StimAngularGuard] type.
  StimAngularGuard of({dynamic name, Set<StimModelTag> tags}) {
    return StimAngularGuard()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
