import 'package:g3m/src/stimpack/meta/meta_gen.dart';
import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';

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
