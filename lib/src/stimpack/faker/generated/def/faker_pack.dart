part of g3.stimpack.faker.generated;


/// The only instance of the [StimFaker] pack.
StimFaker _faker;



class StimFaker extends StimPack {
  StimModelPackage _metaPackage;

  /// Scope class for constructing all "type" symbols, 
  /// typed of [StimFakerType]."
  final StimFakerTypeScope type;

  final OnStimModelTypeForFaker onStimModelType;

  StimFaker(StimModel model):
      type = StimFakerTypeScope(),
      onStimModelType = OnStimModelTypeForFaker(),
      super('faker');


  /// Provides global access to the "faker" pack. Only one instance of the pack 
  /// is created. During the creation, other packs that this pack depends on might 
  /// be created as well.
  static StimFaker stimFakerInstance() {
    if (_faker == null) {
      _faker = StimFaker(stimpack.model);
      _faker._init();
    }
    return _faker;
  }

  void _init() {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();
  }

  void _buildMeta() {
    final m = stimpack.model, f = m.field, t = m.type;
    final mp = _metaPackage = m.package.of(name: 'faker');
    final mt = onStimModelType;
    /// Builds type "type"
    mt.type = t.symbolOf(name: 'type', package: mp);

    /// Builds fields for type "type"
    mt.type.fields = {
      /// field "type"
      f.of(name: 'type', type: t.model.type)..required()
    };
  }
}
