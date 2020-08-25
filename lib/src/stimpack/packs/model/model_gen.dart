import 'package:g3m/src/stimpack/meta/meta_gen.dart';
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
  final m = stimpack.meta, t = m.type, f = m.field, p = m.pack, k = m.kind;

  final tField = t.of('field'), tType = t.of('type'), tRule = t.of('rule');

  final fType = f.of(tType, type: tType);
  final fRules = f.of('rules', type: tRule, kind: k.list);
  final fFields = f.of('fields', type: tField, kind: k.list);

  tType.fields += fFields + fRules;
  tField.fields += fType + fRules;

  final meta = p.of('model', types: tType + tField + tRule);
  stimpackGen(meta, 'lib/src/stimpack/packs/model/_generated');
}
