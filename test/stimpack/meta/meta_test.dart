import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:g3m/stimpack_meta_techlab.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_story.dart';
import 'package:test/test.dart';

class _FakeDartType {}

void main() {
  final model = stimpack.model;
  final t = model.type, f = model.field;

  test('gen', () {
    final meta = model.package.of(name: 'db');
    final tTable = t.symbolOf(name: 'table', package: meta);

    final tDatabase = t.symbolOf(name: 'database', package: meta);
    final tColumn = t.symbolOf(name: 'column', package: meta);
    final tIndex = t.symbolOf(name: 'index', package: meta);

    tDatabase.fields = {
      f.of(name: 'tables', type: t.setOf(item: tTable)).required(),
      f.of(name: 'age', type: t.fromDart(int)),
      // f.of(name: 'fake', type: t.fromDart(_FakeDartType)),
      f.of(name: 'name', type: t.fromDart(StimName)),
      f.of(name: 'set', type: t.fromDart(Set)),
      f.of(name: 'list', type: t.fromDart(List)),
      f.of(name: 'map', type: t.fromDart(Map)),
    };

    tTable.fields = {
      f.of(name: 'columns', type: t.setOf(item: tColumn)).required(),
      f.of(name: 'indices', type: t.setOf(item: tIndex)),
    };

    expect(meta.types.length, equals(4));
    stimpackGen(meta, '/tmp/meta-test', values: {
      tTable: {'user', 'group'},
      t.story.actor: {'new actor'},
    });
  });
}
