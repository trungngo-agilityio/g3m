part of g3.stimpack.angular.generated;



class StimAngularService extends StimModelSymbol<StimAngularService> {
  StimAngularServiceRef _ref;

  StimAngularServiceRef get ref {
    return _ref ??= StimAngularServiceRef();
  }
  StimAngularService();
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
