part of g3.stimpack.angular.generated;



class StimAngularModel extends StimModelSymbol<StimAngularModel> {
  StimAngularModelRef _ref;

  StimAngularModelRef get ref {
    return _ref ??= StimAngularModelRef();
  }
  StimAngularModel();
}


class StimAngularModelRef extends StimSymbolRef<StimAngularModel> implements StimAngularModel {

}


class StimAngularModelScope {
  /// Creates a new "model" of [StimAngularModel] type.
  StimAngularModel of({dynamic name, Set<StimModelTag> tags}) {
    return StimAngularModel()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
