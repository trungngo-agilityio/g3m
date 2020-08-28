import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';

/// Generates the "model" language pack.
/// The generated code is a complete library 'g3.stimpack.model.generated'
///
/// Pack:
/// - Model has many types
/// - Type has many fields, and many rules
/// - Fields has a type, and many rules.
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
void main() {
  final m = stimpack.meta,
      t = m.type,
      f = m.field,
      p = m.preset,
      v = m.value,
      k = m.kind;

  final tField = t.of('field'), tType = t.of('type'), tRule = t.of('rule');

  final fType = f.of(tType, type: tType);
  final fRules = f.of('rules', type: tRule, kind: k.s.list);
  final fFields = f.of('fields', type: tField, kind: k.s.list);

  tType.fields += fFields + fRules;
  tField.fields += fType + fRules;
  tRule.presets += p.of(
    null,
    values: v.of('required') + v.of('unique'),
  );

  tField.presets +=
      p.of('grpc', values: v.of('first name') + v.of('last name'));

  tType.presets += p.of(null,
      values: v.of('double') + v.of('float') + v.of('int32') + v.of('int64'));

  final meta = m.pack.of('model', types: tType + tField + tRule);
  stimpackGen(meta, 'lib/src/stimpack/packs/model/generated');
}
