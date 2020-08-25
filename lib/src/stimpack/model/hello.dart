import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_model.dart';

void main() {
  final t = stimpack.model.type;
  final f = stimpack.model.field;

  final intType = t.of('int');
  final stringType = t.of('string');
  final boolType = t.of('bool');
  final ageField = f.of('age', type: intType);
  final nameField = f.of('age', type: stringType);

  final all = intType + stringType;
  for (var i in all) {
    print(i);
  }

  final fields = ageField + nameField;
  ageField.types = intType + stringType;

  fields
    ..type ^= intType
    ..types += boolType
    ..types ^= (stringType + intType);

  print('int = $intType');
  print('age = $ageField, ${ageField.types}');
  print('age = ${f.of(null)}');
}
