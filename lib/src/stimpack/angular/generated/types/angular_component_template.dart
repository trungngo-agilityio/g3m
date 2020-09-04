part of g3.stimpack.angular.generated;



class StimAngularComponentTemplate extends StimModelSymbol<StimAngularComponentTemplate> {
  StimAngularComponentTemplateRef _ref;

  StimAngularComponentTemplateRef get ref {
    return _ref ??= StimAngularComponentTemplateRef();
  }
  StimAngularComponentTemplate();
}


class StimAngularComponentTemplateRef extends StimSymbolRef<StimAngularComponentTemplate> implements StimAngularComponentTemplate {

}


class StimAngularComponentTemplateScope {
  /// Creates a new "componentTemplate" of [StimAngularComponentTemplate] type.
  StimAngularComponentTemplate of({dynamic name, Set<StimModelTag> tags}) {
    return StimAngularComponentTemplate()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
