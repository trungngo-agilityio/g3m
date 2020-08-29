import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';

void main() {
  final meta = _buildMeta();
  stimpackGen(meta, 'lib/src/stimpack/packs/meta/generated');
}

StimMetaPack _buildMeta() {
  final meta = stimpack.meta;
  final f = meta.field,
      t = meta.type,
      p = meta.preset,
      v = meta.value,
      k = meta.kind;
  final listKind = meta.kind.forMeta.list;

  final kindType = t.of('kind');
  final typeType = t.of('type');
  final fieldType = t.of('field');
  final packType = t.of('pack');
  final presetType = t.of('preset');
  final valueType = t.of('value');

  typeType.fields += f.of('fields', kind: listKind, type: fieldType) +
      f.of('presets', kind: listKind, type: presetType) +
      f.of('pack', type: packType);

  fieldType.fields +=
      f.of('kind', type: kindType) + f.of('type', type: typeType);

  packType.fields += f.of('types', kind: listKind, type: typeType);

  presetType.fields += f.of('values', kind: listKind, type: valueType);

  kindType.presets += p.of(
    'meta',
    values: v.of('list'),
  );

  final packTypes =
      kindType + typeType + fieldType + packType + presetType + valueType;
  final pack = meta.pack.of('meta', types: packTypes);
  packTypes.pack.set(pack);
  return pack;
}
