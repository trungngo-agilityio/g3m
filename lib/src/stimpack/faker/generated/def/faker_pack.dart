part of g3.stimpack.faker.generated;


/// The only instance of the [StimFaker] pack.
StimFaker _faker;



class StimFaker extends StimPack {
  StimModelPackage _metaPackage;

  /// Scope class for constructing all "config" symbols, 
  /// typed of [StimFakerConfig]."
  final StimFakerConfigScope config;

  /// Scope class for constructing all "package" symbols, 
  /// typed of [StimFakerPackage]."
  final StimFakerPackageScope package;

  /// Scope class for constructing all "type" symbols, 
  /// typed of [StimFakerType]."
  final StimFakerTypeScope type;

  /// Scope class for constructing all "field" symbols, 
  /// typed of [StimFakerField]."
  final StimFakerFieldScope field;

  final OnStimModelTypeForFaker onStimModelType;

  StimFaker(StimModel model):
      config = StimFakerConfigScope(),
      package = StimFakerPackageScope(),
      type = StimFakerTypeScope(),
      field = StimFakerFieldScope(),
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
    /// Builds type "config"
    mt.config = t.symbolOf(name: 'config', package: mp);

    /// Builds type "package"
    mt.package = t.symbolOf(name: 'package', package: mp);

    /// Builds type "type"
    mt.type = t.symbolOf(name: 'type', package: mp);

    /// Builds type "field"
    mt.field = t.symbolOf(name: 'field', package: mp);

    /// Builds fields for type "package"
    mt.package.fields = {
      /// field "package"
      f.of(name: 'prefix', type: t.fromDart(String)),

      /// field "package"
      f.of(name: 'package', type: t.model.package),

      /// field "package"
      f.of(name: 'types', type: t.setOf(item: t.model.type)),

      /// field "package"
      f.of(name: 'config', type: mt.config)
    };

    /// Builds fields for type "type"
    mt.type.fields = {
      /// field "type"
      f.of(name: 'package', type: mt.package),

      /// field "type"
      f.of(name: 'params', type: t.setOf(item: t.model.field)),

      /// field "type"
      f.of(name: 'type', type: t.model.type)..required(),

      /// field "type"
      f.of(name: 'fields', type: t.setOf(item: mt.field))
    };

    /// Builds fields for type "field"
    mt.field.fields = {
      /// field "field"
      f.of(name: 'field', type: t.model.field)..required(),

      /// field "field"
      f.of(name: 'type', type: mt.type)..required()
    };
  }
}
