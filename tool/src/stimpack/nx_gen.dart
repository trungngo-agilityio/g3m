import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_io.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_repo.dart';

void main() {
  genNxPack();
}

void genNxPack() {
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'nx');

  // ---------------------------------------------------------------------------
  // Types
  // ---------------------------------------------------------------------------
  final tWorkspace = t.symbolOf(name: 'workspace', package: meta);
  final tLib = t.symbolOf(name: 'lib', package: meta);
  final tApp = t.symbolOf(name: 'app', package: meta);

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------
  final fWorkspace = f.of(name: 'workspace', type: tWorkspace);
  final fProject = f.of(name: 'project', type: t.repo.project);

  final fRepo = f.of(name: 'repo', type: t.repo.repository);
  final fLibSet = f.setOf(name: 'libs', type: tLib);

  final fAppSet = f.setOf(name: 'apps', type: tApp);

  final fDir = f.of(name: 'dir', type: t.io.dir);

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------

  // A directory has a relative path, an absolute path, a set of files,
  // a set of sub dirs.
  tWorkspace.fields = {
    fProject.copyWith()..required(),
    fDir.copyWith(
        name: 'libsDir',
        comment: 'The libs directory that contains all nx libraries')
      ..required(),
    fDir.copyWith(
      name: 'appsDir',
      comment: 'The apps directory that contains all nx applications.',
    )..required(),
    fLibSet.copyWith(
      comment: 'All libraries defined in this nx workspace.',
    )..required(),
    fAppSet.copyWith(
      comment: 'All applications defined in this nx workspace.',
    )..required(),
  };

  // A file has a file type.
  tLib.fields = {
    fWorkspace.copyWith(
      comment: 'The parent project',
    )..required(),
    fRepo.copyWith(
      comment: 'The repo pack repository object.',
    ),
  };

  tApp.fields = {
    fWorkspace.copyWith(
      comment: 'The parent project',
    )..required(),
    fRepo.copyWith(
      comment: 'The repo pack repository object.',
    )..required(),
  };

  stimpackGen(meta, 'lib/src/stimpack', values: {});
}
