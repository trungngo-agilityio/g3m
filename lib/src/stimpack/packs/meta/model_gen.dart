import 'package:g3m/src/stimpack/meta/meta_gen.dart';
import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_meta.dart';


void main() {
  final meta = stimpack.meta;
  final listKind = meta.kind.s.list;

  final kindType = meta.type.of('kind');
  final typeType = meta.type.of('type');
  final fieldType = meta.type.of('field');
  final packType = meta.type.of('pack');
  final presetType = meta.type.of('preset');
  final valueType = meta.type.of('value');

  typeType.fields += meta.field.of('fields', kind: listKind, type: fieldType) +
      meta.field.of('presets', kind: listKind, type: presetType) +
      meta.field.of('pack', type: packType);

  fieldType.fields += meta.field.of('kind', type: kindType) +
      meta.field.of('type', type: typeType);

  packType.fields += meta.field.of('types', kind: listKind, type: typeType);

  presetType.fields += meta.field.of('values', kind: listKind, type: valueType);

  final newMeta = meta.pack.of('meta',
      types:
          kindType + typeType + fieldType + packType + presetType + valueType);

  stimpackGen(newMeta, 'lib/src/stimpack/packs/meta/generated');
}
