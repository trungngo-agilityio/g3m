import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_io.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_semver.dart';

void main() {
  genRepoPack();
}

void genRepoPack() {
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'repo');

  // ---------------------------------------------------------------------------
  // Types
  // ---------------------------------------------------------------------------
  final tProject = t.symbolOf(name: 'project', package: meta);
  final tRepository = t.symbolOf(name: 'repository', package: meta);
  final tDependency = t.symbolOf(name: 'dependency', package: meta);
  final tManifest = t.symbolOf(name: 'manifest', package: meta);

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------
  final fProject = f.of(name: 'project', type: tProject);
  final fRepository = f.of(name: 'repository', type: tRepository);
  final fRepositorySet = f.setOf(name: 'repositories', type: tRepository);
  final fDir = f.of(name: 'dir', type: t.io.dir);
  final fVersion = f.of(name: 'version', type: t.semver.version);
  final fVersionRange =
      f.of(name: 'version range', type: t.semver.versionRange);
  final fDirSet = f.setOf(name: 'dirs', type: t.io.dir);
  final fManifest = f.of(name: 'manifest', type: tManifest);
  final fDependencies = f.setOf(name: 'dependencies', type: tDependency);
  final fDevDependencies = f.setOf(name: 'dev dependencies', type: tDependency);

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------

  // A directory has a relative path, an absolute path, a set of files,
  // a set of sub dirs.
  tProject.fields = {
    fRepositorySet.copyWith(
        comment: 'The set of code repositories defined in the project.'),
    // The root directory
    fDir.copyWith(name: 'path', comment: 'The root directory of the project'),
  };

  // A file has a file type.
  tRepository.fields = {
    fProject.copyWith(
      comment: 'The project this repository is in',
    )..required(),
    fRepository.copyWith(
      name: 'parent repo',
      comment: 'The parent repository of this one.',
    ),
    fRepositorySet.copyWith(
      name: 'child repos',
      comment: 'The child repositories of this one.',
    ),
    fDir.copyWith(
      name: 'path',
      comment: 'The relative path from project root to this repository.',
    ),
    fDirSet.copyWith(
      comment: 'the set of sub directories',
    ),
    fManifest.copyWith(
      comment: 'The manifest defines this dependency',
    ),
  };

  tManifest.fields = {
    fVersionRange.copyWith(
      comment: 'The dependency version range',
    )..required(),
    f.of(
        name: 'description',
        type: t.string,
        comment: 'Additional description about the library'),
    fDependencies.copyWith(
      comment: 'The dependencies of this one, at run time',
    ),
    fDevDependencies.copyWith(
      comment: 'The dev dependencies of this one, at compile time',
    ),
  };

  tDependency.fields = {
    fVersion.copyWith(
      comment: 'The dependency version',
    )..required(),
    fDependencies.copyWith(
      comment: 'The dependencies of this one, at run time',
    ),
    fDevDependencies.copyWith(
      comment: 'The dev dependencies of this one, at compile time',
    ),
    fRepository.copyWith(
      comment: 'The optional repository defined this dependency.',
    ),
  };

  stimpackGen(meta, 'lib/src/stimpack', values: {});
}
