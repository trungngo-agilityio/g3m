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
  // Custom Interfaces
  // ---------------------------------------------------------------------------
  final iVer = t.of(name: 'stim semver versionable', package: null);

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

  final tVersionRange = t.symbolOf(
    name: 'version range',
    package: meta,
    comment: 'Defines the range of versions',
  );

  final tUnaryVersionRange = t.symbolOf(
    name: 'unary version range',
    package: meta,
    comment: 'Defines the range of versions',
  );

  final tVersionRangeOp = t.symbolOf(
    name: 'version range op',
    package: meta,
    comment: 'Defines the operator can be applied to a version range',
  );

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------

  // A directory has a relative path, an absolute path, a set of files,
  // a set of sub dirs.
  tVersion
    ..interfaces = {iVer}
    ..fields = {
      f.of(
        name: 'major',
        type: t.int,
        comment: 'The major version.',
      )..required(),
      f.of(
        name: 'minor',
        type: t.int,
        comment: 'The minor version.',
      )..required(),
      f.of(
        name: 'patch',
        type: t.int,
        comment: 'The patch version',
      ),
      f.of(
        name: 'label',
        type: t.string,
        comment: 'The additional labels.',
      ),
    };

  tUnaryVersionRange
    ..fields = {
      f.of(
        name: 'op',
        type: tVersionRangeOp,
        comment: 'The operator applied to the range',
      )..required(),
      f.of(
        name: 'start',
        type: tVersion,
        comment: 'The inclusive start version of the range.',
      )..required(),
      f.of(
        name: 'end',
        type: tVersion,
        comment:
            'Exclusive end version. This value is not included in the range.',
      )..required(),
    };

  stimpackGen(meta, 'lib/src/stimpack', values: {
    tVersion: {'latest'},
    tVersionRange: {'any'},
    tVersionRangeOp: {
      'compatible with',
      'close to',
      'greater than',
      'greater than or equal',
      'less than or equal',
      'and',
      'or',
      'exact',
    },
  });
}
