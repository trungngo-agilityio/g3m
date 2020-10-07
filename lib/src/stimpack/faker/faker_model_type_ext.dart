part of g3.stimpack.faker.init;

const _fakerTagName = 'faker:faker';

extension OnStimModelTypeFakerExtension on StimModelType {
  StimFakerType get faker => firstValueOfTag<StimFakerType>(_fakerTagName);

  set faker(StimFakerType faker) {
    if (faker == null) {
      removeAllTags(_fakerTagName);
    } else {
      assert(this == faker.type, 'invalid faker type');
      setTag(name: _fakerTagName, value: faker);
    }
  }
}
