import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_rbac.dart';

/// TODO
/// ============================================================================

final m = stimpack.meta,
    t = m.type,
    f = m.field,
    p = m.preset,
    v = m.value,
    k = m.kind,
    model = stimpack.model;

void main() {
  final pack = stimpack.meta.pack.of('rest api');

  // ---------------------------------------------------------------------------
  // Types
  // ---------------------------------------------------------------------------
  final tPackage = t.of('package');
  final tModelApi = t.of('model api');
  final tApi = t.of('api');
  final tModelApiKind = t.of('model api kind',
      values: v.ofNames([
        'create one',
        'update one',
        'find one',
        'delete one',
        'find',
        'delete',
      ]));

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------

  final fModelApis = f.listOf('model apis', type: tModelApi);
  final fApis = f.listOf('apis', type: tApi);
  final fModel = f.of('model', type: t.forModel.type);
  final fRequest = f.listOf('request', type: t.forModel.type);
  final fResponse = f.listOf('response', type: t.forModel.field);
  final fId = f.of('id field', type: t.forModel.field);
  final fRequiredGrants = f.of('required', type: t.forRbac.accessGrant);

  // ---------------------------------------------------------------------------
  // Type Field Mapping
  // ---------------------------------------------------------------------------
  // A package has many model apis, apis
  tPackage.fields += fModelApis + fApis;

  // A model apis, have a model, an field that is the id field of the model.
  // it has optional request (just a bag of fields)
  // and an optional response (just a bag of fields).
  // If any field is provided in the request, the validation rules provided
  // by the field should be used, not the rules in the model fields.
  //
  tModelApi.fields += fModel +
      fId +
      fRequest +
      fResponse +
      f.listOf('apis', type: tModelApiKind) +
      fRequiredGrants;

  // A normal api just have request and response
  tApi.fields += fRequest + fResponse + fRequiredGrants;

  // ---------------------------------------------------------------------------
  // Builds final pack
  // ---------------------------------------------------------------------------
  pack.types = tPackage + tModelApi + tApi + tModelApiKind;

  pack.types.pack.set(pack);

  stimpackGen(pack, 'lib/src/stimpack/packs/rest_api');
}
