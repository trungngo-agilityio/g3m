import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';

void main() {
  final meta = _buildMeta();
  stimpackGen(meta, 'lib/src/stimpack/packs/meta/generated');
}

StimMetaPack _buildMeta() {
  final meta = stimpack.meta;
  final packName = 'meta';
  final pack = meta.pack.of(packName);
  final f = meta.field,
      t = meta.type,
      p = meta.preset,
      v = meta.value,
      k = meta.kind;

  final kSet = k.of('set');

  final tKind = t.of('kind');
  final tType = t.of('type');
  final tField = t.of('field');
  final tPack = t.of('pack');
  final tPreset = t.of('preset');
  final tValue = t.of('value');

  tType.fields +=
      f.of('fields', kind: kSet, type: tField) + f.of('pack', type: tPack);

  tField.fields += f.of('kind', type: tKind) + f.of('type', type: tType);

  tPack.fields += (f.of('types', kind: kSet, type: tType) +
      f.of('presets', kind: kSet, type: tPreset));

  tPreset.fields +=
      f.of('values', kind: kSet, type: tValue) + f.of('type', type: tType);

  pack.presets += p.of(
    packName,
    type: tKind,
    values: v.of('set'),
  );

  pack.types += tKind + tType + tField + tPack + tPreset + tValue;
  // pack.types.pack.set(pack);
  return pack;
}
