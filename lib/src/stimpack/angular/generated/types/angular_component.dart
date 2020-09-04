part of g3.stimpack.angular.generated;

class StimAngularComponent extends StimModelSymbol<StimAngularComponent> {
  StimAngularComponentTemplate template;

  StimAngularComponentStyle style;

  StimAngularComponent();

  StimAngularComponent ref() {
    return StimAngularComponentRef()..symbol = this;
  }

  /// Creates a new "component" of [StimAngularComponent] type.
  StimAngularComponent refWith(
      {dynamic name,
      StimAngularComponentTemplate template,
      StimAngularComponentStyle style,
      Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (template != null) {
      res.template = template;
    }
    if (style != null) {
      res.style = style;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}

class StimAngularComponentRef extends StimSymbolRef<StimAngularComponent>
    implements StimAngularComponent {}

class StimAngularComponentScope {
  /// Creates a new "component" of [StimAngularComponent] type.
  StimAngularComponent of(
      {dynamic name,
      StimAngularComponentTemplate template,
      StimAngularComponentStyle style,
      Set<StimModelTag> tags}) {
    return StimAngularComponent()
      ..name = StimName.of(name)
      ..template = template
      ..style = style
      ..tags = tags ?? {};
  }
}
