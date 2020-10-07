part of g3.stimpack.faker.init;

/// This function is called during the initialization of faker
void _stimInitFakerPack() {
  final ft = stimpack.faker.type;
  ft.none = ft.of(name: 'none', type: null);
}
