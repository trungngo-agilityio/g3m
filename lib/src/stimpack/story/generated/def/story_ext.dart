part of g3.stimpack.story.generated;



class OnStimModelTypeForStory {
  StimModelType epic;

  StimModelType story;

  StimModelType action;

  StimModelType actor;
}



extension OnStimModelTypeForStoryExtension on StimModelTypeScope {
  OnStimModelTypeForStory get story {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimStory.stimStoryInstance().onStimModelType;
  }
}
