import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_io.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';

void main() {
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'repo');

  final tRepo = t.symbolOf(name: 'repo', package: meta);

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------

  final fDir = f.of(name: 'dir', type: t.io.dir);
  final fRepoSet = f.setOf(name: 'repos', type: tRepo);

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------

  tRepo.fields = {fDir, fRepoSet};

  stimpackGen(meta, 'lib/src/stimpack', values: {});
}
