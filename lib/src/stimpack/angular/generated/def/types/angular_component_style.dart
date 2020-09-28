part of g3.stimpack.angular.generated;



class StimAngularComponentStyle extends StimModelSymbol<StimAngularComponentStyle> {
  StimAngularComponentStyle();


  /// Creates a new "componentStyle" of [StimAngularComponentStyle] type.
  StimAngularComponentStyle copyWith({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularComponentStyle()
        ..name = StimName.of(name ?? this.name)
        ..tags = tags ?? this.tags;
  }
}


class StimAngularComponentStyleScope {
  /// Creates a new "componentStyle" of [StimAngularComponentStyle] type.
  StimAngularComponentStyle of({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularComponentStyle()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
