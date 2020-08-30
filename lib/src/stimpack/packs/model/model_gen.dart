import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';

/// Generates the "model" language pack.
/// The generated code is a complete library 'g3.stimpack.model.generated'
///
/// Pack:
/// - Model has many types
/// - Type has many fields, and many rules
/// - Fields has a type, and many rules.
/// - Rule has many patterns, and many ranges
///
/// Example:
/// - rules: required, unique, no negative
/// - type: string, double
/// - fields:
///     - name, type: string, rules: required, unique
///     - description, type: string
///     - cost: type: double, rules: no negative
/// - models:
///     - product,  fields: name, description, cost
///     - category, fields: name, description
///
/// ============================================================================

final m = stimpack.meta,
    t = m.type,
    f = m.field,
    p = m.preset,
    v = m.value,
    k = m.kind;

// grpc data type
const grpcTypes = [
  'double',
  'float',
  'int32',
  'int64',
  'uint32',
  'uint64',
  'sint32',
  'sint64',
  'fixed32',
  'fixed64',
  'sfixed32',
  'sfixed64',
  'string',
  'bytes',
];

const commonTypes = [
  'url',
];

const dateTypes = [
  'timestamp',
  'date',
  'time',
  'datetime',
  'local date',
  'local time',
  'local datetime',
];

const oauthFields = [
  'access token',
  'refresh token',
  'expired in',
];

const dbFields = [
  'id',
  'created at',
  'modified at',
  'version',
];

const paginationFields = [
  'total',
  'count',
  'size',
  'index',
  'page size',
  'page index',
  'offset',
  'limit',
];

const userProfileFields = [
  'user id',
  'user name',
  'email',
  'email verified',
  'phone',
  'phone verified',
  'password',
  'confirm password',
  'name',
  'desc',
  'first name',
  'last name',
  'middle name',
  'gender',
  'birthday',
  'photo url',
  'avatar url',
];

const authModels = [
  'user',
  'user profile',
  'access token',
];

const validationPatterns = [
  'id',
  'uuid v4',
  'slug',
  'ipv4',
  'ipv6',
  'ip',
  'url',
  'email',
  'username',
  'password',
  'phone',
  'alpha'
];

const validationRules = [
  'unique',
  'required',
  'text',
  'desc',
  'long text',
  'short text',
];

void main() {
  final pack = stimpack.meta.pack.of('model');

  final tField = t.of('field'),
      tType = t.of('type'),
      tRule = t.of('rule'),
      tPattern = t.of('pattern'),
      tRange = t.of('range');


  final fType = f.of('type', type: tType);
  final fRules = f.listOf('rules', type: tRule);
  final fFields = f.listOf('fields', type: tField);
  final fRange = f.listOf('range', type: tRange);
  final fPatterns = f.listOf('patterns', type: tPattern);

  tType.fields += fFields + fRules;
  tField.fields += fType + fRules;
  tRule.fields += fRange + fPatterns;

  // ---------------------------------------------------------------------------
  // Preset settings
  // ---------------------------------------------------------------------------

  pack.presets += p.ofValues('validation',
          type: tRule, values: [...validationRules, ...validationPatterns]) +
      p.ofValues('validation', type: tPattern, values: validationPatterns) +
      p.ofValues('user', type: tField, values: userProfileFields) +
      p.ofValues('pagination', type: tField, values: paginationFields) +
      p.ofValues('db', type: tField, values: dbFields) +
      p.ofValues('grpc', type: tType, values: grpcTypes) +
      p.ofValues('date', type: tType, values: dateTypes) +
      p.ofValues('auth', type: tType, values: authModels) +
      p.ofValues('common', type: tType, values: commonTypes);

  // ---------------------------------------------------------------------------
  // Builds final pack
  // ---------------------------------------------------------------------------
  pack.types = tType + tField + tRule + tPattern + tRange;
  pack.types.pack.set(pack);

  stimpackGen(pack, 'lib/src/stimpack/packs/model');
}
