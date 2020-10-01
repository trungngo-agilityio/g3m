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
  final tConfig = t.symbolOf(
    name: 'config',
    package: meta,
    comment: 'The configuration for a faker set',
  );

  final tPackageFaker = t.symbolOf(
    name: 'package',
    package: meta,
    comment: 'The package contains different fakers',
  );

  final tTypeFaker = t.symbolOf(
    name: 'type',
    package: meta,
    comment: 'A faker that builds a [type].',
  );

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------
  final tFieldFaker = t.symbolOf(name: 'field', package: meta);

  // ---------------------------------------------------------------------------
  // Type vs. Fields
  // ---------------------------------------------------------------------------

  tPackageFaker.fields += {
    f.of(
      name: 'prefix',
      type: t.string,
      comment: 'The common prefix for all generated code',
    ),
  };

  tPackageFaker.fields += {
    f.of(
      name: 'package',
      type: t.model.package,
      comment: 'The package that this faker is for.',
    ),
    f.of(
      name: 'types',
      type: t.model.typeSet,
      comment: 'The set of all type fakers in the package.',
    ),
    f.of(
      name: 'config',
      type: tConfig,
      comment: 'The global configuration applied to the package',
    ),
  };

  tTypeFaker.fields += {
    f.of(
      name: 'package',
      type: tPackageFaker,
      comment: 'The package that this type faker is belong to',
    ),
    f.of(
      name: 'params',
      type: t.model.fieldSet,
      comment: 'The set of [params] that need to be sent to the faker',
    ),
    f.of(
      name: 'type',
      type: t.model.type,
      comment: 'The data [type] that this faker works with.',
    )..required(),
    f.setOf(
      name: 'fields',
      type: tFieldFaker,
      comment:
          'The set of fields, from the model type this faker can generate. \n'
          'This should not be set for primitive data types like string, int, etc.',
    ),
  };

  tFieldFaker.fields = {
    f.of(
      name: 'field',
      type: t.model.field,
      comment: 'The model field that the [faker] is applied.',
    )..required(),
    f.of(
      name: 'type',
      type: tTypeFaker,
      comment: 'The faker applied to the [field].',
    )..required(),
  };

  // ---------------------------------------------------------------------------
  // Generates
  // ---------------------------------------------------------------------------

  final fakers = <String>{};
  for (final e in fakerApis.entries) {
    var k = e.key;
    for (final v in e.value) {
      fakers.add('$k $v');
    }
  }

  var mt = stimpack.model.type;
  final primitiveTypes = mt.primitiveTypes - mt.type;
  for (final t in primitiveTypes) {
    fakers.add(('random' >> t.name).toString());
  }

  stimpackGen(meta, 'lib/src/stimpack', values: {
    tTypeFaker: fakers,
  });
}

const fakerApis = <String, Set<String>>{
  'lorem': {
    'word',
    'words',
    'sentence',
    'sentences',
    'paragraph',
    'paragraphs',
  },
};
