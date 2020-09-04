part of g3.stimpack.angular.generated;



class StimAngularComponentStyle extends StimModelSymbol<StimAngularComponentStyle> {
  StimAngularComponentStyleRef _ref;

  StimAngularComponentStyleRef get ref {
    return _ref ??= StimAngularComponentStyleRef();
  }
  StimAngularComponentStyle();
}


class StimAngularComponentStyleRef extends StimSymbolRef<StimAngularComponentStyle> implements StimAngularComponentStyle {

}


class StimAngularComponentStyleScope {
  /// Creates a new "componentStyle" of [StimAngularComponentStyle] type.
  StimAngularComponentStyle of({dynamic name, Set<StimModelTag> tags}) {
    return StimAngularComponentStyle()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
