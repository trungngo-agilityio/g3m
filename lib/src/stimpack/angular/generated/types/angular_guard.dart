part of g3.stimpack.angular.generated;



class StimAngularGuard extends StimModelSymbol<StimAngularGuard> {
  StimAngularGuard();


  StimAngularGuard ref() {
    return StimAngularGuardRef()..symbol = this;
  }

  /// Creates a new "guard" of [StimAngularGuard] type.
  StimAngularGuard refWith({dynamic name, Set<StimModelTag> tags}) {
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
