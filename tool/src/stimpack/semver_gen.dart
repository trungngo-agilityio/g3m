import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';

void main() {
  genSemverPack();
}

void genSemverPack() {
  final m = stimpack.model;
  final t = m.type, f = m.field;
  final meta = m.package.of(name: 'semver');

  // ---------------------------------------------------------------------------
  // Types
  // ---------------------------------------------------------------------------
  final tVersion = t.symbolOf(name: 'version', package: meta, comment: '''
Given a version number [major].[minor].[patch], increment the: 
- [major] version when you make incompatible API changes,
- [minor] version when you add functionality in a backwards compatible manner, 
- [patch] version when you make backwards compatible bug fixes.

Additional labels for pre-release and build metadata are available as 
extensions to the MAJOR.MINOR.PATCH format.''');

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------

  // A directory has a relative path, an absolute path, a set of files,
  // a set of sub dirs.
  tVersion.fields = {
    f.of(name: 'major', type: t.string, comment: 'The major version.')
      ..required(),
    f.of(name: 'minor', type: t.string, comment: 'The minor version.')
      ..required(),
    f.of(name: 'patch', type: t.string, comment: 'The patch version'),
    f.of(name: 'label', type: t.string, comment: 'The additional labels.'),
  };

  stimpackGen(meta, 'lib/src/stimpack', values: {});
}
