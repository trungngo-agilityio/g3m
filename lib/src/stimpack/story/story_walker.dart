import 'package:g3m/src/stimpack/story/generated/story.dart';

class StoryWalker {
  void visitStory(StimStoryStory story) {
    if (story.actor != null) visitActor(story.actor);
    if (story.action != null) visitAction(story.action);
  }

  void visitAction(StimStoryAction action) {}

  void visitActor(StimStoryActor actor) {}
}
