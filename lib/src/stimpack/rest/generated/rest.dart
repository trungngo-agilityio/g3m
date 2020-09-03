library g3.stimpack.rest.generated;


import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:meta/meta.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_rbac.dart';
part '../rest_init.dart';
part 'rest_api.dart';
part 'rest_api_request.dart';
part 'rest_api_response.dart';
part 'rest_crud_api.dart';
part 'rest_crud_create_one_api.dart';
part 'rest_crud_update_one_api.dart';
part 'rest_crud_find_one_api.dart';
part 'rest_crud_delete_one_api.dart';
part 'rest_crud_find_api.dart';
part 'rest_crud_delete_api.dart';


/// The only instance of the [StimRest] pack.
StimRest _rest;



class StimRest extends StimPack {
  final StimRestTypeMeta meta;

  StimModelPackage _metaPackage;

  /// Scope class for constructing all "api" symbols, 
  /// typed of [StimRestApi]."
  final StimRestApiScope api;

  /// Scope class for constructing all "apiRequest" symbols, 
  /// typed of [StimRestApiRequest]."
  final StimRestApiRequestScope apiRequest;

  /// Scope class for constructing all "apiResponse" symbols, 
  /// typed of [StimRestApiResponse]."
  final StimRestApiResponseScope apiResponse;

  /// Scope class for constructing all "crudApi" symbols, 
  /// typed of [StimRestCrudApi]."
  final StimRestCrudApiScope crudApi;

  /// Scope class for constructing all "crudCreateOneApi" symbols, 
  /// typed of [StimRestCrudCreateOneApi]."
  final StimRestCrudCreateOneApiScope crudCreateOneApi;

  /// Scope class for constructing all "crudUpdateOneApi" symbols, 
  /// typed of [StimRestCrudUpdateOneApi]."
  final StimRestCrudUpdateOneApiScope crudUpdateOneApi;

  /// Scope class for constructing all "crudFindOneApi" symbols, 
  /// typed of [StimRestCrudFindOneApi]."
  final StimRestCrudFindOneApiScope crudFindOneApi;

  /// Scope class for constructing all "crudDeleteOneApi" symbols, 
  /// typed of [StimRestCrudDeleteOneApi]."
  final StimRestCrudDeleteOneApiScope crudDeleteOneApi;

  /// Scope class for constructing all "crudFindApi" symbols, 
  /// typed of [StimRestCrudFindApi]."
  final StimRestCrudFindApiScope crudFindApi;

  /// Scope class for constructing all "crudDeleteApi" symbols, 
  /// typed of [StimRestCrudDeleteApi]."
  final StimRestCrudDeleteApiScope crudDeleteApi;


  StimRest(StimModel model, StimRbac rbac):
      meta = StimRestTypeMeta(),
      api = StimRestApiScope(),
      apiRequest = StimRestApiRequestScope(),
      apiResponse = StimRestApiResponseScope(),
      crudApi = StimRestCrudApiScope(),
      crudCreateOneApi = StimRestCrudCreateOneApiScope(),
      crudUpdateOneApi = StimRestCrudUpdateOneApiScope(),
      crudFindOneApi = StimRestCrudFindOneApiScope(),
      crudDeleteOneApi = StimRestCrudDeleteOneApiScope(),
      crudFindApi = StimRestCrudFindApiScope(),
      crudDeleteApi = StimRestCrudDeleteApiScope(),
      super('rest') {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();

    /// Call custom pack initialization code, this code is
    /// not overwritten during pack re-generation. 
    stimInitRestPack(this);
  }


  void _buildMeta() {
    final m = stimpack.model;
    final mp = _metaPackage = m.package.of(name: 'rest');
    final f = m.field, t = m.type;


    /// Builds type "api"
    meta.api = t.symbolOf(name: 'api', package: mp);

    /// Builds type "apiRequest"
    meta.apiRequest = t.symbolOf(name: 'apiRequest', package: mp);

    /// Builds type "apiResponse"
    meta.apiResponse = t.symbolOf(name: 'apiResponse', package: mp);

    /// Builds type "crudApi"
    meta.crudApi = t.symbolOf(name: 'crudApi', package: mp);

    /// Builds type "crudCreateOneApi"
    meta.crudCreateOneApi = t.symbolOf(name: 'crudCreateOneApi', package: mp);

    /// Builds type "crudUpdateOneApi"
    meta.crudUpdateOneApi = t.symbolOf(name: 'crudUpdateOneApi', package: mp);

    /// Builds type "crudFindOneApi"
    meta.crudFindOneApi = t.symbolOf(name: 'crudFindOneApi', package: mp);

    /// Builds type "crudDeleteOneApi"
    meta.crudDeleteOneApi = t.symbolOf(name: 'crudDeleteOneApi', package: mp);

    /// Builds type "crudFindApi"
    meta.crudFindApi = t.symbolOf(name: 'crudFindApi', package: mp);

    /// Builds type "crudDeleteApi"
    meta.crudDeleteApi = t.symbolOf(name: 'crudDeleteApi', package: mp);


    /// Builds fields for type "api"
    meta.api.fields = {
      /// field "api"
      f.of(name: 'policy', type: t.rbac.policy),


      /// field "api"
      f.of(name: 'request', type: meta.apiRequest),


      /// field "api"
      f.of(name: 'response', type: meta.apiResponse)
    };


    /// Builds fields for type "apiRequest"
    meta.apiRequest.fields = {
      /// field "apiRequest"
      f.of(name: 'streamed', type: t.bool),


      /// field "apiRequest"
      f.of(name: 'fields', type: t.setOf(item: t.model.field))
    };


    /// Builds fields for type "apiResponse"
    meta.apiResponse.fields = {
      /// field "apiResponse"
      f.of(name: 'streamed', type: t.bool),


      /// field "apiResponse"
      f.of(name: 'fields', type: t.setOf(item: t.model.field))
    };


    /// Builds fields for type "crudApi"
    meta.crudApi.fields = {
      /// field "crudApi"
      f.of(name: 'model', type: t.model.type),


      /// field "crudApi"
      f.of(name: 'create one', type: meta.crudCreateOneApi),


      /// field "crudApi"
      f.of(name: 'update one', type: meta.crudUpdateOneApi),


      /// field "crudApi"
      f.of(name: 'find one', type: meta.crudFindOneApi),


      /// field "crudApi"
      f.of(name: 'delete one', type: meta.crudDeleteOneApi),


      /// field "crudApi"
      f.of(name: 'find', type: meta.crudFindApi),


      /// field "crudApi"
      f.of(name: 'delete', type: meta.crudDeleteApi)
    };


    /// Builds fields for type "crudCreateOneApi"
    meta.crudCreateOneApi.fields = {
      /// field "crudCreateOneApi"
      f.of(name: 'policy', type: t.rbac.policy),


      /// field "crudCreateOneApi"
      f.of(name: 'id field', type: t.model.field),


      /// field "crudCreateOneApi"
      f.of(name: 'response', type: t.setOf(item: t.model.field))
    };


    /// Builds fields for type "crudUpdateOneApi"
    meta.crudUpdateOneApi.fields = {
      /// field "crudUpdateOneApi"
      f.of(name: 'policy', type: t.rbac.policy),


      /// field "crudUpdateOneApi"
      f.of(name: 'id field', type: t.model.field),


      /// field "crudUpdateOneApi"
      f.of(name: 'response', type: t.setOf(item: t.model.field))
    };


    /// Builds fields for type "crudFindOneApi"
    meta.crudFindOneApi.fields = {
      /// field "crudFindOneApi"
      f.of(name: 'policy', type: t.rbac.policy),


      /// field "crudFindOneApi"
      f.of(name: 'id field', type: t.model.field),


      /// field "crudFindOneApi"
      f.of(name: 'response', type: t.setOf(item: t.model.field))
    };


    /// Builds fields for type "crudDeleteOneApi"
    meta.crudDeleteOneApi.fields = {
      /// field "crudDeleteOneApi"
      f.of(name: 'policy', type: t.rbac.policy),


      /// field "crudDeleteOneApi"
      f.of(name: 'id field', type: t.model.field),


      /// field "crudDeleteOneApi"
      f.of(name: 'response', type: t.setOf(item: t.model.field))
    };
  }
}


class StimRestTypeMeta {
  StimModelType api;

  StimModelType apiRequest;

  StimModelType apiResponse;

  StimModelType crudApi;

  StimModelType crudCreateOneApi;

  StimModelType crudUpdateOneApi;

  StimModelType crudFindOneApi;

  StimModelType crudDeleteOneApi;

  StimModelType crudFindApi;

  StimModelType crudDeleteApi;
}



// Provides global access to the "rest" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension StimRestPackExtension on StimpackRoot {
  StimRest get rest {
    return _rest ??= StimRest(stimpack.model, stimpack.rbac);
  }
}


extension StimRestTypeMetaExtension on StimModelTypeScope {
  StimRestTypeMeta get rest {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return stimpack.rest.meta;
  }
}
