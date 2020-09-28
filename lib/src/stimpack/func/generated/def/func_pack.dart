part of g3.stimpack.func.generated;


/// The only instance of the [StimFunc] pack.
StimFunc _func;



class StimFunc extends StimPack {
  StimModelPackage _metaPackage;

  /// Scope class for constructing all "map" symbols, 
  /// typed of [StimFuncMap]."
  final StimFuncMapScope map;

  /// Scope class for constructing all "fieldMap" symbols, 
  /// typed of [StimFuncFieldMap]."
  final StimFuncFieldMapScope fieldMap;

  /// Scope class for constructing all "filter" symbols, 
  /// typed of [StimFuncFilter]."
  final StimFuncFilterScope filter;

  final OnStimModelTypeForFunc onStimModelType;

  StimFunc(StimModel model):
      map = StimFuncMapScope(),
      fieldMap = StimFuncFieldMapScope(),
      filter = StimFuncFilterScope(),
      onStimModelType = OnStimModelTypeForFunc(),
      super('func');


  /// Provides global access to the "func" pack. Only one instance of the pack 
  /// is created. During the creation, other packs that this pack depends on might 
  /// be created as well.
  static StimFunc stimFuncInstance() {
    if (_func == null) {
      _func = StimFunc(stimpack.model);
      _func._init();
    }
    return _func;
  }

  void _init() {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();
  }

  void _buildMeta() {
    final m = stimpack.model, f = m.field, t = m.type;
    final mp = _metaPackage = m.package.of(name: 'func');
    final mt = onStimModelType;
    /// Builds type "map"
    mt.map = t.symbolOf(name: 'map', package: mp);

    /// Builds type "fieldMap"
    mt.fieldMap = t.symbolOf(name: 'fieldMap', package: mp);

    /// Builds type "filter"
    mt.filter = t.symbolOf(name: 'filter', package: mp);

    /// Builds fields for type "map"
    mt.map.fields = {
      /// field "map"
      f.of(name: 'from', type: t.model.type),

      /// field "map"
      f.of(name: 'to', type: t.model.type),

      /// field "map"
      f.of(name: 'removed fields', type: t.setOf(item: t.model.field)),

      /// field "map"
      f.of(name: 'mapped fields', type: t.setOf(item: mt.fieldMap)),

      /// field "map"
      f.of(name: 'code', type: t.fromDart(StimModelFuncCode))
    };

    /// Builds fields for type "fieldMap"
    mt.fieldMap.fields = {
      /// field "fieldMap"
      f.of(name: 'from', type: t.model.field),

      /// field "fieldMap"
      f.of(name: 'to', type: t.model.field),

      /// field "fieldMap"
      f.of(name: 'map', type: mt.map)
    };

    /// Builds fields for type "filter"
    mt.filter.fields = {
      /// field "filter"
      f.of(name: 'from', type: t.model.type),

      /// field "filter"
      f.of(name: 'code', type: t.fromDart(StimModelFuncCode))
    };
  }
}
