part of g3.stimpack.angular.generated;



class StimAngularModel extends StimModelSymbol<StimAngularModel> {
  StimAngularModel();


  /// Creates a new "model" of [StimAngularModel] type.
  StimAngularModel copyWith({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularModel()
        ..name = StimName.of(name ?? this.name)
        ..tags = tags ?? this.tags;
  }
}


class StimAngularModelScope {
  /// Creates a new "model" of [StimAngularModel] type.
  StimAngularModel of({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularModel()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
