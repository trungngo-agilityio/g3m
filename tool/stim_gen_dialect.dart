import 'package:g3m/stimpack.dart';
import 'package:g3m/stimpack_ex.dart';
import 'package:g3m/techlab_core.dart';
import 'package:g3m/techlab_stimpack.dart';

final w = WorldEx();
Set<DataType> nativeTypes;

bool isNativeType(DataType type) {
  return nativeTypes.contains(type);
}

void main() {
  // Cache the existing types before adding anything new in.
  nativeTypes = w.type.all.eval();

  final m = w.model, f = w.field, t = w.type;

  final packType = t('meta pack');
  final fieldType = t('meta field');
  final termType = t('meta term');
  final typeType = t('meta type');
  final relationTypeType = t('meta relation type');

  // Special fields
  final pluralField = f('plural', t.bool);
  final fieldsField = f('fields', fieldType);
  final termsField = f('terms', termType);
  final fromTermField = f('from', termType);
  final toTermField = f('to', termType);
  final packField = f('pack', packType);
  final typeField = f('type', typeType);
  final relationTypeField = f('type', relationTypeType);

  // To be generated models
  final packModel = m('meta pack')..fields = termsField;

  final termModel = m('meta term')
    ..fields = termsField + fieldsField + packField;

  final fieldModel = m('meta field')..fields = typeField + pluralField;

  final typeModel = m('meta type')..fields = f.desc;

  final relationModel = m('meta relation')
    ..fields = fromTermField + toTermField + relationTypeField;

  final relationTypeModel = m('meta relation type')..fields = f.desc;

  // This is the list of all models to be generated.
  final models = termModel +
      packModel +
      fieldModel +
      typeModel +
      relationModel +
      relationTypeModel;

  _generateDialect(models: models, name: 'meta');
}

void _generateDialect({
  Model models,
  String name,
}) {
  Node program = SingleChildNode(
    Directory.relative(
      'lib/src/stimpack/packs/gen',
      Container([
        StimpackDialect(name: name, models: models),
      ]),
    ),
  );

  Program.execute(program);
}
