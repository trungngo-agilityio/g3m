import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_model.dart';

void main() {
  final t = stimpack.model.type,
      f = stimpack.model.field,
      r = stimpack.model.rule;

  final required = r.of('required'), unique = r.of('unique');
  final int = t.of('int'),
      string = t.of('string'),
      bool = t.of('bool'),
      person = t.of('person');

  person.fields += f.of('name', type: string + unique) +
      f.of('age', type: int, rules: required) +
      f.of('nick', type: string, rules: required) +
      f.of('archived', type: bool);
}
