part of g3.stimpack.story.generated;



class StimStoryOnStimModelType {
  StimModelType epic;

  StimModelType story;

  StimModelType action;

  StimModelType actor;
}



extension StimStoryOnStimModelTypeExtension on StimModelTypeScope {
  StimStoryOnStimModelType get story {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimStory.stimStoryInstance().onStimModelType;
  }
}
