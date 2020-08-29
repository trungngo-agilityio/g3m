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

const defaultRules = [
  'unique',
  'required',
];

const validationRules = [
  'text',
  'desc',
  'long text',
  'short text',
];

void main() {
  final tField = t.of('field'),
      tType = t.of('type'),
      tRule = t.of('rule'),
      tPattern = t.of('pattern'),
      tRange = t.of('range');

  final fType = f.of('type', type: tType);
  final fRules = f.of('rules', type: tRule, kind: k.s.list);
  final fFields = f.of('fields', type: tField, kind: k.s.list);
  final fRange = f.of('range', type: tRange);
  final fPatterns = f.of('patterns', type: tPattern, kind: k.s.list);

  tType.fields += fFields + fRules;
  tField.fields += fType + fRules;
  tRule.fields += fRange + fPatterns;

  // ---------------------------------------------------------------------------
  // Preset settings
  // ---------------------------------------------------------------------------

  tRule.presets += p.ofValues(null, defaultRules) +
      p.ofValues('validation', [...validationRules, ...validationPatterns]);

  tPattern.presets += p.ofValues('validation', validationPatterns);

  tField.presets += p.ofValues('user', userProfileFields) +
      p.ofValues('pagination', paginationFields) +
      p.ofValues('db', dbFields);

  tType.presets += p.ofValues('grpc', grpcTypes) +
      p.ofValues('date', dateTypes) +
      p.ofValues('auth', authModels) +
      p.ofValues('common', commonTypes);

  final meta = m.pack
      .of('model', types: tType + tField + tRule + tPattern + tRange);

  stimpackGen(meta, 'lib/src/stimpack/packs/model/generated');
}
