import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';

void main() {
  genIoPack();
}

void genIoPack() {
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'io');

  // ---------------------------------------------------------------------------
  // Types
  // ---------------------------------------------------------------------------
  final tFile = t.symbolOf(name: 'file', package: meta);
  final tFileType = t.symbolOf(name: 'file type', package: meta);
  final tDir = t.symbolOf(name: 'dir', package: meta);

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------
  final fFileExtension = f.of(name: 'path', type: t.string);
  final fPath = f.of(name: 'path', type: t.string);
  final fAbsolutePath = f.of(name: 'absolute path', type: t.string);

  final fFileType = f.of(name: 'type', type: tFileType);

  final fFile = f.of(name: 'file', type: tFile);
  final fFileSet = f.setOf(name: 'files', type: tFile);

  final fDir = f.of(name: 'dir', type: tDir);
  final fDirSet = f.setOf(name: 'dirs', type: tDir);

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------

  // A directory has a relative path, an absolute path, a set of files,
  // a set of sub dirs.
  tDir.fields = {fPath, fAbsolutePath, fFileSet, fDirSet};

  // A file has a file type.
  tFile.fields = {fFileType};

  tFileType.fields = {fFileExtension};

  stimpackGen(meta, 'lib/src/stimpack', values: {
    tFileType: {
      'txt',
    },
  });
}
