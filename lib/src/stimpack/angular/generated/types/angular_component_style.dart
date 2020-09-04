part of g3.stimpack.angular.generated;



class StimAngularComponentStyle extends StimModelSymbol<StimAngularComponentStyle> {
  StimAngularComponentStyle();


  StimAngularComponentStyle ref() {
    return StimAngularComponentStyleRef()..symbol = this;
  }

  /// Creates a new "componentStyle" of [StimAngularComponentStyle] type.
  StimAngularComponentStyle refWith({dynamic name, Set<StimModelTag> tags}) {
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
