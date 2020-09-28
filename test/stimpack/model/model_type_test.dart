import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_story.dart';
import 'package:test/test.dart';

class _FakeSymbol extends StimModelSymbol<_FakeSymbol> {}

void main() {
  final m = stimpack.model, t = m.type;

  test('test dart type', () {
    try {
      final t1 = t.fromDart(StimStoryStory);
      fail('should not get here');
    } catch (_) {
      // just ignore
    }
  });
}
