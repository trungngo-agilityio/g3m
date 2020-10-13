part of g3.stimpack.meta;

StimMeta _meta;

extension StimMetaExtension on StimpackRoot {
  StimMeta get meta {
    return StimMeta.stimMetaInstance();
  }
}

class StimMeta extends StimPack {
  final StimMetaPackScope pack;
  final OnStimModelTypeRuleForMeta onStimModelTypeRule;

  StimMeta(StimModel model)
      : pack = StimMetaPackScope(),
        onStimModelTypeRule = OnStimModelTypeRuleForMeta(),
        super('meta');

  static StimMeta stimMetaInstance() {
    if (_meta == null) {
      _meta = StimMeta(stimpack.model);
      _meta._init();
    }
    return _meta;
  }

  void _init() {
    final r = stimpack.model.typeRule;
    final mr = onStimModelTypeRule;
    mr.interface = r.of(name: 'interface');
  }

  void validate(StimModelPackage pack) {
    StimMetaValidator().validatePack(pack);
  }
}
