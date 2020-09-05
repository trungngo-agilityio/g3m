part of g3.stimpack.angular.generated;



class StimAngularModel extends StimModelSymbol<StimAngularModel> {
  StimAngularModel();


  StimAngularModel ref() {
    return StimAngularModelRef()..symbol = this;
  }

  /// Creates a new "model" of [StimAngularModel] type.
  StimAngularModel refWith({dynamic name, Set<StimModelTag> tags}) {
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
