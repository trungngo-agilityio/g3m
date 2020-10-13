part of g3.stimpack.faker.init;

extension OnStimFakerTypeExtension on StimFakerType {
  bool get isNone {
    return this == stimpack.faker.type.none;
  }
}

extension OnStimFakerTypeScopeExtension on StimFakerTypeScope {
  StimFakerType defaultForType(StimModelType type, {dynamic name}) {
    final faker = forType(type, name: name);
    type.faker = faker;
    return faker;
  }

  StimFakerType forType(StimModelType type, {dynamic name}) {
    assert(type != null, 'type is required');
    name ??= StimName.refOf(type);
    return of(name: name, type: type);
  }
}
