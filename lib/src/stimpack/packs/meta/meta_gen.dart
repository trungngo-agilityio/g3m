import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';

void main() {
  final meta = _buildMeta();
  stimpackGen(meta, 'lib/src/stimpack/packs/meta/generated');
}

StimMetaPack _buildMeta() {
  final meta = stimpack.meta;
  final pack = meta.pack.of('meta');
  final f = meta.field, t = meta.type.forMeta, p = meta.preset, v = meta.value;
  final listKind = meta.kind.forMeta.list;

  final kindType = t.kind;
  final typeType = t.type;
  final fieldType = t.field;
  final packType = t.pack;
  final presetType = t.preset;
  final valueType = t.value;

  typeType.fields.set(f.of('fields', kind: listKind, type: fieldType) +
      f.of('pack', type: packType));

  fieldType.fields
      .set(f.of('kind', type: kindType) + f.of('type', type: typeType));

  packType.fields.set(f.of('types', kind: listKind, type: typeType) +
      f.of('presets', kind: listKind, type: presetType));

  presetType.fields.set(
      f.of('values', kind: listKind, type: valueType) +
      f.of('type', type: typeType));

  pack.presets.set(
      p.of(
        'meta',
        type: t.kind,
        values: v.of('list'),
      ) +
      p.of(
        'meta',
        type: t.type,
        values: v.of('kind') +
            v.of('type') +
            v.of('field') +
            v.of('pack') +
            v.of('preset') +
            v.of('value'),
      ));

  pack.types
      .set(kindType + typeType + fieldType + packType + presetType + valueType);
  pack.types.pack.set(pack);
  return pack;
}
