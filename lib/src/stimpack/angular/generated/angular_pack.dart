part of g3.stimpack.angular.generated;


/// The only instance of the [StimAngular] pack.
StimAngular _angular;



class StimAngular extends StimPack {
  StimModelPackage _metaPackage;

  /// Scope class for constructing all "app" symbols, 
  /// typed of [StimAngularApp]."
  final StimAngularAppScope app;

  /// Scope class for constructing all "feature" symbols, 
  /// typed of [StimAngularFeature]."
  final StimAngularFeatureScope feature;

  /// Scope class for constructing all "module" symbols, 
  /// typed of [StimAngularModule]."
  final StimAngularModuleScope module;

  /// Scope class for constructing all "service" symbols, 
  /// typed of [StimAngularService]."
  final StimAngularServiceScope service;

  /// Scope class for constructing all "model" symbols, 
  /// typed of [StimAngularModel]."
  final StimAngularModelScope model;

  /// Scope class for constructing all "resolver" symbols, 
  /// typed of [StimAngularResolver]."
  final StimAngularResolverScope resolver;

  /// Scope class for constructing all "router" symbols, 
  /// typed of [StimAngularRouter]."
  final StimAngularRouterScope router;

  /// Scope class for constructing all "routerPath" symbols, 
  /// typed of [StimAngularRouterPath]."
  final StimAngularRouterPathScope routerPath;

  /// Scope class for constructing all "routerParam" symbols, 
  /// typed of [StimAngularRouterParam]."
  final StimAngularRouterParamScope routerParam;

  /// Scope class for constructing all "routerEntry" symbols, 
  /// typed of [StimAngularRouterEntry]."
  final StimAngularRouterEntryScope routerEntry;

  /// Scope class for constructing all "routerRedirect" symbols, 
  /// typed of [StimAngularRouterRedirect]."
  final StimAngularRouterRedirectScope routerRedirect;

  /// Scope class for constructing all "guard" symbols, 
  /// typed of [StimAngularGuard]."
  final StimAngularGuardScope guard;

  /// Scope class for constructing all "component" symbols, 
  /// typed of [StimAngularComponent]."
  final StimAngularComponentScope component;

  /// Scope class for constructing all "componentTemplate" symbols, 
  /// typed of [StimAngularComponentTemplate]."
  final StimAngularComponentTemplateScope componentTemplate;

  /// Scope class for constructing all "componentStyle" symbols, 
  /// typed of [StimAngularComponentStyle]."
  final StimAngularComponentStyleScope componentStyle;

  final StimAngularOnStimModelType onStimModelType;

  final StimAngularOnStimIoDir onStimIoDir;


  StimAngular(StimModel model, StimIo io):
      app = StimAngularAppScope(),
      feature = StimAngularFeatureScope(),
      module = StimAngularModuleScope(),
      service = StimAngularServiceScope(),
      model = StimAngularModelScope(),
      resolver = StimAngularResolverScope(),
      router = StimAngularRouterScope(),
      routerPath = StimAngularRouterPathScope(),
      routerParam = StimAngularRouterParamScope(),
      routerEntry = StimAngularRouterEntryScope(),
      routerRedirect = StimAngularRouterRedirectScope(),
      guard = StimAngularGuardScope(),
      component = StimAngularComponentScope(),
      componentTemplate = StimAngularComponentTemplateScope(),
      componentStyle = StimAngularComponentStyleScope(),
      onStimModelType = StimAngularOnStimModelType(),
      onStimIoDir = StimAngularOnStimIoDir(),
      super('angular') {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();

    /// Call custom pack initialization code, this code is
    /// not overwritten during pack re-generation. 
    stimInitAngularPack(this);
  }


  void _buildMeta() {
    final m = stimpack.model, f = m.field, t = m.type;
    final mp = _metaPackage = m.package.of(name: 'angular');
    final mt = onStimModelType;
    /// Builds type "app"
    mt.app = t.symbolOf(name: 'app', package: mp);

    /// Builds type "feature"
    mt.feature = t.symbolOf(name: 'feature', package: mp);

    /// Builds type "module"
    mt.module = t.symbolOf(name: 'module', package: mp);

    /// Builds type "service"
    mt.service = t.symbolOf(name: 'service', package: mp);

    /// Builds type "model"
    mt.model = t.symbolOf(name: 'model', package: mp);

    /// Builds type "resolver"
    mt.resolver = t.symbolOf(name: 'resolver', package: mp);

    /// Builds type "router"
    mt.router = t.symbolOf(name: 'router', package: mp);

    /// Builds type "routerPath"
    mt.routerPath = t.symbolOf(name: 'routerPath', package: mp);

    /// Builds type "routerParam"
    mt.routerParam = t.symbolOf(name: 'routerParam', package: mp);

    /// Builds type "routerEntry"
    mt.routerEntry = t.symbolOf(name: 'routerEntry', package: mp);

    /// Builds type "routerRedirect"
    mt.routerRedirect = t.symbolOf(name: 'routerRedirect', package: mp);

    /// Builds type "guard"
    mt.guard = t.symbolOf(name: 'guard', package: mp);

    /// Builds type "component"
    mt.component = t.symbolOf(name: 'component', package: mp);

    /// Builds type "componentTemplate"
    mt.componentTemplate = t.symbolOf(name: 'componentTemplate', package: mp);

    /// Builds type "componentStyle"
    mt.componentStyle = t.symbolOf(name: 'componentStyle', package: mp);

    /// Builds fields for type "app"
    mt.app.fields = {
      /// field "app"
      f.of(name: 'feature dir', type: t.io.dir),

      /// field "app"
      f.of(name: 'features', type: t.setOf(item: mt.feature))
    };

    /// Builds fields for type "feature"
    mt.feature.fields = {
      /// field "feature"
      f.of(name: 'features', type: t.setOf(item: mt.feature)),

      /// field "feature"
      f.of(name: 'module', type: mt.module)
    };

    /// Builds fields for type "module"
    mt.module.fields = {
      /// field "module"
      f.of(name: 'services', type: t.setOf(item: mt.service)),

      /// field "module"
      f.of(name: 'models', type: t.setOf(item: mt.model)),

      /// field "module"
      f.of(name: 'entry components', type: t.setOf(item: mt.component)),

      /// field "module"
      f.of(name: 'exports', type: t.setOf(item: mt.module)),

      /// field "module"
      f.of(name: 'router', type: mt.router),

      /// field "module"
      f.of(name: 'resolver', type: mt.resolver)
    };

    /// Builds fields for type "router"
    mt.router.fields = {
      /// field "router"
      f.of(name: 'entries', type: t.setOf(item: mt.router)),

      /// field "router"
      f.of(name: 'redirects', type: t.setOf(item: mt.routerRedirect))
    };

    /// Builds fields for type "routerPath"
    mt.routerPath.fields = {
      /// field "routerPath"
      f.of(name: 'path', type: t.string),

      /// field "routerPath"
      f.of(name: 'parent', type: mt.routerPath),

      /// field "routerPath"
      f.of(name: 'params', type: t.setOf(item: mt.routerParam))
    };

    /// Builds fields for type "routerEntry"
    mt.routerEntry.fields = {
      /// field "routerEntry"
      f.of(name: 'path', type: mt.routerPath),

      /// field "routerEntry"
      f.of(name: 'component', type: mt.component),

      /// field "routerEntry"
      f.of(name: 'resolver', type: mt.resolver),

      /// field "routerEntry"
      f.of(name: 'guards', type: t.setOf(item: mt.guard)),

      /// field "routerEntry"
      f.of(name: 'lazy module', type: mt.module)
    };

    /// Builds fields for type "routerRedirect"
    mt.routerRedirect.fields = {
      /// field "routerRedirect"
      f.of(name: 'path', type: mt.routerPath)
    };

    /// Builds fields for type "component"
    mt.component.fields = {
      /// field "component"
      f.of(name: 'template', type: mt.componentTemplate),

      /// field "component"
      f.of(name: 'style', type: mt.componentStyle)
    };
  }
}



// Provides global access to the "angular" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension StimAngularPackExtension on StimpackRoot {
  StimAngular get angular {
    return _angular ??= StimAngular(stimpack.model, stimpack.io);
  }
}
