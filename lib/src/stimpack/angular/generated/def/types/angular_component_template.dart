part of g3.stimpack.angular.generated;



class StimAngularComponentTemplate extends StimModelSymbol<StimAngularComponentTemplate> {
  StimAngularComponentTemplate();


  /// Creates a new "componentTemplate" of [StimAngularComponentTemplate] type.
  StimAngularComponentTemplate copyWith({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularComponentTemplate()
        ..name = StimName.of(name ?? this.name)
        ..tags = tags ?? this.tags;
  }
}


class StimAngularComponentTemplateScope {
  /// Creates a new "componentTemplate" of [StimAngularComponentTemplate] type.
  StimAngularComponentTemplate of({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularComponentTemplate()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
