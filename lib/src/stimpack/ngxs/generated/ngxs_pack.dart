part of g3.stimpack.ngxs.generated;

/// The only instance of the [StimNgxs] pack.
StimNgxs _ngxs;

class StimNgxs extends StimPack {
  StimModelPackage _metaPackage;

  /// Scope class for constructing all "feature" symbols,
  /// typed of [StimNgxsFeature]."
  final StimNgxsFeatureScope feature;

  /// Scope class for constructing all "action" symbols,
  /// typed of [StimNgxsAction]."
  final StimNgxsActionScope action;

  /// Scope class for constructing all "state" symbols,
  /// typed of [StimNgxsState]."
  final StimNgxsStateScope state;

  /// Scope class for constructing all "select" symbols,
  /// typed of [StimNgxsSelect]."
  final StimNgxsSelectScope select;

  final StimNgxsOnStimModelType onStimModelType;

  StimNgxs(StimModel model)
      : feature = StimNgxsFeatureScope(),
        action = StimNgxsActionScope(),
        state = StimNgxsStateScope(),
        select = StimNgxsSelectScope(),
        onStimModelType = StimNgxsOnStimModelType(),
        super('ngxs') {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();

    /// Call custom pack initialization code, this code is
    /// not overwritten during pack re-generation.
    stimInitNgxsPack(this);
  }

  void _buildMeta() {
    final m = stimpack.model, f = m.field, t = m.type;
    final mp = _metaPackage = m.package.of(name: 'ngxs');
    final mt = onStimModelType;

    /// Builds type "feature"
    mt.feature = t.symbolOf(name: 'feature', package: mp);

    /// Builds type "action"
    mt.action = t.symbolOf(name: 'action', package: mp);

    /// Builds type "state"
    mt.state = t.symbolOf(name: 'state', package: mp);

    /// Builds type "select"
    mt.select = t.symbolOf(name: 'select', package: mp);

    /// Builds fields for type "feature"
    mt.feature.fields = {
      /// field "feature"
      f.of(name: 'states', type: t.setOf(item: mt.state))
    };

    /// Builds fields for type "action"
    mt.action.fields = {
      /// field "action"
      f.of(name: 'fields', type: t.setOf(item: t.model.field))
    };

    /// Builds fields for type "state"
    mt.state.fields = {
      /// field "state"
      f.of(name: 'model', type: t.model.type),

      /// field "state"
      f.of(name: 'actions', type: t.setOf(item: mt.action)),

      /// field "state"
      f.of(name: 'selects', type: t.setOf(item: mt.select))
    };

    /// Builds fields for type "select"
    mt.select.fields = {
      /// field "select"
      f.of(name: 'field', type: t.model.field)
    };
  }
}

// Provides global access to the "ngxs" pack. Only one instance of the pack
// is created. During the creation, other packs that this pack depends on might
// be created as well.
//
extension StimNgxsPackExtension on StimpackRoot {
  StimNgxs get ngxs {
    return _ngxs ??= StimNgxs(stimpack.model);
  }
}
