import 'package:g3m/stimpack_base.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:test/test.dart';

void main() {
  final f = stimpack.model.field, r = stimpack.model.rule;
  test('initialized', () {
    expect(f.username, isNotNull);
    expect(f.username.rules.contains(r.username), isTrue);
  });
}
