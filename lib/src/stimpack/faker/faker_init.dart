part of g3.stimpack.faker.init;

/// This function is called during the initialization of faker
void _stimInitFakerPack() {
  // init faker here
  final mt = stimpack.model.type;
  final ff = stimpack.model.field;
  final ft = stimpack.faker.type;

  final fCount = ff.of(name: 'count', type: mt.num);
  final fMin = ff.of(name: 'min', type: mt.num);
  final fMax = ff.of(name: 'max', type: mt.num);

  final fMinDuration = ff.of(name: 'min', type: mt.duration);
  final fMaxDuration = ff.of(name: 'max', type: mt.duration);

  final fUriHost = ff.of(name: 'host', type: mt.string);
  final fUriPort = ff.of    (name: 'port', type: mt.num);

  // Lorem
  ft.loremWord = mt.string.fake(name: 'lorem word');
  ft.loremWord = mt.string.fake(name: 'lorem words', params: {fCount});
  ft.loremSentence = mt.string.fake(name: 'lorem sentence');
  ft.loremSentences = mt.string.fake(name: 'lorem sentences', params: {fCount});
  ft.loremParagraph = mt.string.fake(name: 'lorem paragraph');
  ft.loremParagraphs =
      mt.string.fake(name: 'lorem paragraphs', params: {fCount});

  // Random
  ft.randomNum = mt.num.fake(name: 'random num', params: {fMin, fMax});
  ft.randomInt = mt.int.fake(name: 'random int', params: {fMin, fMax});
  ft.randomDouble = mt.double.fake(name: 'random double', params: {fMin, fMax});
  ft.randomBool = mt.bool.fake(name: 'random boolean');
  ft.randomDateTime = mt.dateTime.fake(name: 'random date');
  ft.randomDuration = mt.duration
      .fake(name: 'random duration', params: {fMinDuration, fMaxDuration});
  ft.randomUri = mt.bool.fake(name: 'random uri', params: {fUriHost, fUriPort});
}
