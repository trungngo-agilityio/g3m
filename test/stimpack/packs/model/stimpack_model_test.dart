import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:test/test.dart';

void main() {
  final t = stimpack.model.type,
      f = stimpack.model.field,
      r = stimpack.model.rule;

  test('work fine', () {
    final required = r.of('required'), unique = r.of('unique');
    final int = t.of('int'),
        string = t.of('string'),
        bool = t.of('bool'),
        person = t.of('person');

    person.fields += f.of('name', type: string, rules: unique) +
        f.of('age', type: int, rules: required) +
        f.of('nick', type: string, rules: required) +
        f.of('archived', type: bool);
  });

  test('grpc available', () {
    print(r.username);
    expect(r.username, isNotNull);
  });

  test('grpc available', () {
    expect(f.forUser.firstName, isNotNull);
    print(f.forUser.firstName);
  });
}
