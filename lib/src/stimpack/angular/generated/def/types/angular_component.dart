part of g3.stimpack.angular.generated;



class StimAngularComponent extends StimModelSymbol<StimAngularComponent> {
  StimAngularComponentTemplate template;

  StimAngularComponentStyle style;

  StimAngularComponent();


  /// Creates a new "component" of [StimAngularComponent] type.
  StimAngularComponent copyWith({@required
  dynamic name, StimAngularComponentTemplate template, StimAngularComponentStyle style, Set<StimModelTag> tags}) {
    return StimAngularComponent()
        ..name = StimName.of(name ?? this.name)
        ..template = template ?? this.template
        ..style = style ?? this.style
        ..tags = tags ?? this.tags;
  }
}


class StimAngularComponentScope {
  /// Creates a new "component" of [StimAngularComponent] type.
  StimAngularComponent of({@required
  dynamic name, StimAngularComponentTemplate template, StimAngularComponentStyle style, Set<StimModelTag> tags}) {
    return StimAngularComponent()
        ..name = StimName.of(name)
        ..template = template
        ..style = style
        ..tags = tags ?? {};
  }
}
