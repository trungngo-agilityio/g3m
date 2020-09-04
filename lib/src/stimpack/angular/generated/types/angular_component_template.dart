part of g3.stimpack.angular.generated;

class StimAngularComponentTemplate
    extends StimModelSymbol<StimAngularComponentTemplate> {
  StimAngularComponentTemplate();

  StimAngularComponentTemplate ref() {
    return StimAngularComponentTemplateRef()..symbol = this;
  }

  /// Creates a new "componentTemplate" of [StimAngularComponentTemplate] type.
  StimAngularComponentTemplate refWith({dynamic name, Set<StimModelTag> tags}) {
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

class StimAngularComponentTemplateRef
    extends StimSymbolRef<StimAngularComponentTemplate>
    implements StimAngularComponentTemplate {}

class StimAngularComponentTemplateScope {
  /// Creates a new "componentTemplate" of [StimAngularComponentTemplate] type.
  StimAngularComponentTemplate of({dynamic name, Set<StimModelTag> tags}) {
    return StimAngularComponentTemplate()
      ..name = StimName.of(name)
      ..tags = tags ?? {};
  }
}
