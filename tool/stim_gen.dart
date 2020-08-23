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

  // Special fields
  final packageField = f('package', t.string);
  final author = f('author', t('author'));

  // To be generated models
  final packageModel = m('package')
    ..fields = f.desc + f.version + packageField + author;

  final authorModel = m('author')
    ..fields = f.firstName + f.middleName + f.lastName + f.email;

  final dependencyModel = m('dependency')..fields = f.version + f.desc;

  // This is the list of all models to be generated.
  final models = authorModel + packageModel + dependencyModel;

  _generateDialect(models: models, name: 'pacman');
}

void _generateDialect({
  Model models,
  String name,
}) {
  Node program = SingleChildNode(
    Directory.relative(
      'tool/src/generated',
      Container([
        StimpackDialect(name: name, models: models),
      ]),
    ),
  );

  Program.execute(program);
}
