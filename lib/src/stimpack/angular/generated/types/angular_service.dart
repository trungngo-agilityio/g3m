part of g3.stimpack.angular.generated;



class StimAngularService extends StimModelSymbol<StimAngularService> {
  StimAngularService();


  StimAngularService ref() {
    return StimAngularServiceRef()..symbol = this;
  }

  /// Creates a new "service" of [StimAngularService] type.
  StimAngularService refWith({dynamic name, Set<StimModelTag> tags}) {
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


class StimAngularServiceRef extends StimSymbolRef<StimAngularService> implements StimAngularService {

}


class StimAngularServiceScope {
  /// Creates a new "service" of [StimAngularService] type.
  StimAngularService of({dynamic name, Set<StimModelTag> tags}) {
    return StimAngularService()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
