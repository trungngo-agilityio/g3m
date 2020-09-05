part of g3.stimpack.meta;

StimMeta _meta;

extension StimMetaExtension on StimpackRoot {
  StimMeta get meta {
    return _meta ??= StimMeta();
  }
}

class StimMeta extends StimPack {
  final StimMetaPackScope pack;

  StimMeta()
      : pack = StimMetaPackScope(),
        super('meta');

  void validate(StimModelPackage pack) {
    StimMetaValidator().validatePack(pack);
  }
}
