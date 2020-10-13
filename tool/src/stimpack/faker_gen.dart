import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';

void main() {
  genFirebasePack();
}

void genFirebasePack() {
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'faker');

  // ---------------------------------------------------------------------------
  // Types
  // ---------------------------------------------------------------------------
  final tType = t.symbolOf(
    name: 'type',
    package: meta,
    comment: 'A set of fakers available for a type [type].',
  );

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------
  tType.fields += {
    f.of(
      name: 'type',
      type: t.model.type,
      comment: 'The data [type] that this faker works with.',
    )..required(),
  };

  // ---------------------------------------------------------------------------
  // Generates
  // ---------------------------------------------------------------------------
  stimpackGen(meta, 'lib/src/stimpack', values: {
    tType: {
      'none',
    }
  });
}
