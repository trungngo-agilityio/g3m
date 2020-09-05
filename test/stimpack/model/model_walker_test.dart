import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_story.dart';
import 'package:test/test.dart';

class _FakeDartType {}

void main() {
  final model = stimpack.model;
  final t = model.type, f = model.field;

  test('walk story', () {
    final story = stimpack.story,
        s = story.story,
        a = story.actor,
        v = story.action;

    final s1 = s.of(actor: a.of(name: 'user'), action: v.signIn);
    StimModelWalker()
        .on(
            type: t.story.story,
            exec: (context, s) {
              print('visit story: ${s.action.name}');
              return false;
            })
        .on(
            type: t.story.action,
            exec: (context, s) {
              print('visit action: ${s.name}');
              return false;
            })
        .on(
            type: t.story.actor,
            exec: (_, actor) {
              print(actor.name);
              return false;
            })
        .walk(t.story.story, s1);
  });
}
