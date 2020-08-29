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

  var m = meta.type.forMeta;
  final kindType = m.kind;
  final typeType = m.type;
  final fieldType = m.field;
  final packType = m.pack;
  final presetType = t.of('preset');
  final valueType = t.of('value');

  typeType.fields += f.of('fields', kind: listKind, type: fieldType) +
      f.of('presets', kind: listKind, type: presetType) +
      f.of('pack', type: packType);

  fieldType.fields +=
      f.of('kind', type: kindType) + f.of('type', type: typeType);

  packType.fields += f.of('types', kind: listKind, type: typeType) +
      f.of('presets', kind: listKind, type: presetType);

  presetType.fields += f.of('values', kind: listKind, type: valueType) +
      f.of('type', type: typeType);

  kindType.presets += p.of(
    'meta',
    type: kindType,
    values: v.of('list'),
  );

  final packTypes =
      kindType + typeType + fieldType + packType + presetType + valueType;
  final pack = meta.pack.of('meta', types: packTypes);
  packTypes.pack.set(pack);
  return pack;
}
