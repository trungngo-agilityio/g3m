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

//    StimModelWalker(s1).visit<StimStoryAction>((context, e1) {
//      print('Found; ${e1.name}');
//    });

    StimModelWalker(s1).visit2<StimStoryStory, StimStoryAction>((context, e1, e2) {
      print('Found; ${e1.name}, ${e2.name}');
    });

  });
}
