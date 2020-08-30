import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';

/// Generates the "model" language pack.
/// The generated code is a complete library 'g3.stimpack.model.generated'
///
/// Pack:
/// - Package: has many types
/// - Type has many fields, many rules, extend other types
/// - Fields has a type, and many rules.
/// - Rule has many patterns, and many ranges
///
/// Example:
/// - rules: required, unique, no negative
/// - type: string, double
/// - types:
///     - product,  fields: name, description, cost
///     - category, fields: name, description
/// - fields:
///     - name, type: string, rules: required, unique
///     - description, type: string
///     - cost: type: double, rules: no negative
///
/// ============================================================================

final m = stimpack.meta,
    t = m.type,
    f = m.field,
    p = m.preset,
    v = m.value,
    k = m.kind;

// Scalar types. We follow proto3 for easier gRPC code generation.
// See: https://developers.google.com/protocol-buffers/docs/proto3#scalar

const grpcTypes = [
  'double',

  'float',

  /// Uses variable-length encoding. Inefficient for encoding negative numbers
  /// – if your field is likely to have negative values, use sint32 instead
  'int32',

  /// Uses variable-length encoding. Inefficient for encoding negative numbers
  /// - if your field is likely to have negative values, use sint64 instead.
  'int64',

  /// Uses variable-length encoding.
  'uint32',

  /// Uses variable-length encoding.
  'uint64',

  /// Uses variable-length encoding. Signed int value. These more efficiently
  /// encode negative numbers than regular int32s.
  'sint32',

  /// Uses variable-length encoding. Signed int value. These more
  /// efficiently encode negative numbers than regular int64s.
  'sint64',

  /// Always four bytes. More efficient than uint32 if values are often
  /// greater than 228.
  'fixed32',

  /// Always eight bytes. More efficient than uint64 if values are often
  /// greater than 256.
  'fixed64',

  /// Always four bytes.
  'sfixed32',

  /// Always eight bytes.
  'sfixed64',

  'bool',

  /// A string must always contain UTF-8 encoded or 7-bit ASCII text,
  /// and cannot be longer than 232.
  'string',

  /// May contain any arbitrary sequence of bytes no longer than 232.
  'bytes',
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
  'username',
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
  'api page',
  'api offset limit',
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
  'human name',
  'birth day',
];

void main() {
  final pack = stimpack.meta.pack.of('model');

  final tPackage = t.of('package', values: v.ofNames(['primitive']));
  final tField = t.of('field',
      values: v.ofNames([
        ...userProfileFields,
        ...paginationFields,
        ...dbFields,
        ...oauthFields,
      ]));

  final tType = t.of('type',
      values: v.ofNames([
        ...grpcTypes,
        ...dateTypes,
        ...authModels,
      ]));

  final tRule = t.of('rule',
      values: v.ofNames([
        ...validationPatterns,
        ...validationRules,
      ]));

  final tPattern = t.of('pattern', values: v.ofNames(validationPatterns));
  final tRange = t.of('range');

  final fType = f.of('type', type: tType);
  final fTypes = f.listOf('types', type: tType);
  final fMixins = f.listOf('mixins', type: tType);
  final fRules = f.listOf('rules', type: tRule);
  final fFields = f.listOf('fields', type: tField);
  final fRange = f.listOf('range', type: tRange);
  final fPatterns = f.listOf('patterns', type: tPattern);

  tPackage.fields += fTypes;
  tType.fields += fMixins + fFields + fRules;
  tField.fields += fType + fRules;
  tRule.fields += fRange + fPatterns;

  // ---------------------------------------------------------------------------
  // Builds final pack
  // ---------------------------------------------------------------------------
  pack.types = tPackage + tType + tField + tRule + tPattern + tRange;
  pack.types.pack.set(pack);

  stimpackGen(pack, 'lib/src/stimpack/packs/model');
}
