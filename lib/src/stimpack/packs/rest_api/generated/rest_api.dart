library g3.stimpack.rest_api.generated;


import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_rbac.dart';
import 'package:g3m/stimpack_meta.dart';
part 'rest_api_presets.dart';
part '../rest_api_init.dart';
part 'rest_api__package.dart';
part 'rest_api__package__model_apis.dart';
part 'rest_api__package__apis.dart';
part 'rest_api__model_api.dart';
part 'rest_api__model_api__model.dart';
part 'rest_api__model_api__id_field.dart';
part 'rest_api__model_api__request.dart';
part 'rest_api__model_api__response.dart';
part 'rest_api__model_api__apis.dart';
part 'rest_api__model_api__required.dart';
part 'rest_api__api.dart';
part 'rest_api__api__request.dart';
part 'rest_api__api__response.dart';
part 'rest_api__api__required.dart';
part 'rest_api__model_api_kind.dart';



abstract class StimRestApi {
  StimMetaPack get meta;
  StimRestApiPackageScope get package;
  StimRestApiModelApiScope get modelApi;
  StimRestApiApiScope get api;
  StimRestApiModelApiKindScope get modelApiKind;
}


class StimRestApiImpl  implements StimRestApi {
  StimMetaPack _meta;

  _StimRestApiPackageScopeImpl _package;

  _StimRestApiModelApiScopeImpl _modelApi;

  _StimRestApiApiScopeImpl _api;

  _StimRestApiModelApiKindScopeImpl _modelApiKind;

  StimMetaXTypeXPreset _metaXTypeXPreset;

  @override
  StimMetaPack get meta {
    return _meta;
  }
  @override
  _StimRestApiPackageScopeImpl get package {
    return _package;
  }
  @override
  _StimRestApiModelApiScopeImpl get modelApi {
    return _modelApi;
  }
  @override
  _StimRestApiApiScopeImpl get api {
    return _api;
  }
  @override
  _StimRestApiModelApiKindScopeImpl get modelApiKind {
    return _modelApiKind;
  }

  StimRestApiImpl() {
    _package = _StimRestApiPackageScopeImpl();
    _modelApi = _StimRestApiModelApiScopeImpl();
    _api = _StimRestApiApiScopeImpl();
    _modelApiKind = _StimRestApiModelApiKindScopeImpl();
    _metaXTypeXPreset = StimMetaXTypeXPreset();
  }


  void init() {
    _package.init();
    _modelApi.init();
    _api.init();
    _modelApiKind.init();
    _metaXTypeXPreset.init(stimpack.meta.type);
    _buildMeta();
    stimInitRestApiPack(this);
  }

  void _buildMeta() {
    final meta = stimpack.meta;
    final pack = meta.pack.of('restApi');
    final f = meta.field, t = meta.type, p = meta.preset, v = meta.value, k = meta.kind;

    t.forRestApi.package.fields = f.noneSet +
        f.of('modelApis', kind: k.set, type: t.forRestApi.modelApi) + 
        f.of('apis', kind: k.set, type: t.forRestApi.api);

    t.forRestApi.modelApi.fields = f.noneSet +
        f.of('model', type: t.forModel.type) + 
        f.of('idField', type: t.forModel.field) + 
        f.of('request', kind: k.set, type: t.forModel.type) + 
        f.of('response', kind: k.set, type: t.forModel.field) + 
        f.of('apis', kind: k.set, type: t.forRestApi.modelApiKind) + 
        f.of('required', type: t.forRbac.accessGrant);

    t.forRestApi.api.fields = f.noneSet +
        f.of('request', kind: k.set, type: t.forModel.type) + 
        f.of('response', kind: k.set, type: t.forModel.field) + 
        f.of('required', type: t.forRbac.accessGrant);

    pack.presets = p.noneSet +
        p.of('', type: t.forMeta.type, values: 
              v.of('package') + 
              v.of('modelApi') + 
              v.of('api') + 
              v.of('modelApiKind'),);

    pack.types = t.forRestApi.all;
    pack.types.pack.set(pack);
    _meta = pack;
  }
}
StimRestApi  _stimRestApi;

extension StimRestApiStimpackExtension on Stimpack {
  StimRestApi get restApi {
    if (_stimRestApi == null) {
      final impl = _stimRestApi = StimRestApiImpl();
      impl.init();
      return _stimRestApi;
    }
    
    return _stimRestApi;
  }
}
    