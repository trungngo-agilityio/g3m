import 'package:g3m/stimpack2_core.dart';
import 'package:g3m/stimpack2_meta.dart';
import 'package:g3m/stimpack2_meta_techlab.dart';
import 'package:g3m/stimpack2_model.dart';
import 'package:test/test.dart';

void main() {
  final model = stimpack.model;
  final t = model.type, f = model.field;

  test('gen', () {
    final meta = model.package.of(name: 'db');
    final tTable =
        t.symbolOf(name: 'table', package: meta, fields: null, values: {
      'user',
      'group',
    });

    final tDatabase = t.symbolOf(name: 'database', package: meta, fields: null);
    tDatabase.fields = {
      f.of(name: 'tables', type: t.setOf(item: tTable)).required(),
    };

    expect(meta.types.length, equals(2));
    stimpackGen(meta, '/tmp/meta-test');
  });
}
