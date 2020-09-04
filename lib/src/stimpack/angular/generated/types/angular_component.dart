part of g3.stimpack.angular.generated;



class StimAngularComponent extends StimModelSymbol<StimAngularComponent> {
  StimAngularComponentTemplate template;

  StimAngularComponentStyle style;

  StimAngularComponentRef _ref;

  StimAngularComponentRef get ref {
    return _ref ??= StimAngularComponentRef();
  }
  StimAngularComponent();
}


class StimAngularComponentRef extends StimSymbolRef<StimAngularComponent> implements StimAngularComponent {

}


class StimAngularComponentScope {
  /// Creates a new "component" of [StimAngularComponent] type.
  StimAngularComponent of({dynamic name, StimAngularComponentTemplate template, StimAngularComponentStyle style, Set<StimModelTag> tags}) {
    return StimAngularComponent()
        ..name = StimName.of(name)
        ..template = template
        ..style = style
        ..tags = tags ?? {};
  }
}
