import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';

void main() {
  genFuncPack();
}

void genFuncPack() {
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'func');

  // ---------------------------------------------------------------------------
  // Types
  // ---------------------------------------------------------------------------
  final tMapFunc = t.symbolOf(name: 'map func', package: meta);
  final tFieldMap = t.symbolOf(name: 'field map', package: meta);
  final tFilter = t.symbolOf(name: 'filter', package: meta);

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------
  tMapFunc.fields = {
    f.of(name: 'from', type: t.model.type),
    f.of(name: 'to', type: t.model.type),
    f.of(name: 'removed fields', type: t.model.fieldSet),
    f.setOf(name: 'mapped fields', type: tFieldMap),
  };

  tFieldMap.fields = {
    f.of(name: 'from', type: t.model.field),
    f.of(name: 'to', type: t.model.field),
    f.of(name: 'map', type: tMapFunc),
  };

  tFilter.fields = {
    f.of(name: 'from', type: t.model.type),
  };

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------

  stimpackGen(meta, 'lib/src/stimpack', values: {});
}
