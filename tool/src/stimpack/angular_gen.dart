import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_io.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';

void main() {
  genAngularPack();
}

void genAngularPack() {
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'angular');

  StimModelType type(String name) => t.symbolOf(name: name, package: meta);
  StimModelField field(String name, StimModelType type) =>
      f.of(name: name, type: type);
  StimModelField fieldSet(String name, StimModelType type) =>
      f.setOf(name: name, type: type);

  final tApp = type('app');
  final tFeature = type('feature');
  final tModule = type('module');
  final tService = type('service');
  final tModel = type('model');
  final tResolver = type('resolver');
  final tRouter = type('router');
  final tRouterPath = type('router path');
  final tRouterParam = type('router param');
  final tRouterEntry = type('router entry');
  final tRouterRedirectEntry = type('router redirect');
  final tGuard = type('guard');
  final tComponent = type('component');
  final tComponentTemplate = type('component template');
  final tComponentStyle = type('component style');

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------
  final fDir = f.of(name: 'dir', type: t.io.dir);
  final fFile = f.of(name: 'file', type: t.io.file);
  final fPath = f.of(name: 'path', type: t.string);

  final fFeature = field('feature', tFeature);
  final fFeatureSet = fieldSet('features', tFeature);

  final fModule = field('module', tModule);
  final fModuleSet = fieldSet('modules', tModule);

  final fService = field('service', tService);
  final fServiceSet = fieldSet('services', tService);

  final fModel = field('model', tModel);
  final fModelSet = fieldSet('models', tModel);

  final fResolver = field('resolver', tResolver);
  final fResolverSet = fieldSet('resolvers', tResolver);

  final fRouterPath = field('path', tRouterPath);
  final fRouterPathSet = fieldSet('paths', tRouterPath);

  final fRouterParam = field('param', tRouterParam);
  final fRouterParamSet = fieldSet('params', tRouterParam);

  final fRouter = field('router', tRouter);
  final fRouterSet = fieldSet('routers', tRouter);

  final fRouterEntry = field('entry', tRouter);
  final fRouterEntrySet = fieldSet('entries', tRouter);

  final fRouterRedirectEntry = field('redirect', tRouterRedirectEntry);
  final fRouterRedirectEntrySet = fieldSet('redirects', tRouterRedirectEntry);

  final fGuard = field('guard', tGuard);
  final fGuardSet = fieldSet('guards', tGuard);

  final fComponent = field('component', tComponent);
  final fComponentSet = fieldSet('components', tComponent);

  final fComponentTemplate = field('template', tComponentTemplate);
  final fComponentTemplateSet = fieldSet('templates', tComponentTemplate);

  final fComponentStyle = field('style', tComponentStyle);
  final fComponentStyleSet = fieldSet('styles', tComponentStyle);

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------

  // An angular app is a set of feature
  tApp.fields = {
    fDir.copyWith(name: 'root dir'),
    fDir.copyWith(name: 'feature dir'),
    fFeatureSet,
  };

  // a feature can have many sub feature
  tFeature.fields = {fFeatureSet, fModule};

  // An angular module have a set of services, models,
  // declared components, entry components, router, and a resolver.
  tModule.fields = {
    fServiceSet,
    fModelSet,
    fComponentSet.copyWith(name: 'declarations'),
    fComponentSet.copyWith(name: 'entry components'),
    fModuleSet.copyWith(name: 'imports'),
    fModuleSet.copyWith(name: 'exports'),
    fRouter,
    fResolver,
  };

  tRouter.fields = {
    fRouterEntrySet,
    fRouterRedirectEntrySet,
  };

  tRouterPath.fields = {
    fPath,
    fRouterPath.copyWith(name: 'parent'),
    fRouterParamSet,
  };

  tRouterEntry.fields = {
    fRouterPath,
    fComponent,
    fResolver,
    fGuardSet,
    fModule.copyWith(name: 'lazy module'),
  };

  tRouterRedirectEntry.fields = {
    fRouterPath,
  };

  tComponent.fields = {fComponentTemplate, fComponentStyle};

  stimpackGen(meta, 'lib/src/stimpack', values: {
    t.io.dir: {
      // The angular app root.
      'repo root',
      'repo src',
      'repo assets',
      'repo styles',
      'repo i18n',
      'repo app',
    }
  });
}
