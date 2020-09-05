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
    StimModelWalker({
      t.story.story: (context, s) {
        final story = s as StimStoryStory;
        print('visit story: ${story.action.name}');
        return false;
      },

      t.story.action: (context, s) {
        final action = s as StimStoryAction;
        print('visit action: ${action.name}');
        return false;
      }
    }).walk(t.story.story, s1);
  });
}
