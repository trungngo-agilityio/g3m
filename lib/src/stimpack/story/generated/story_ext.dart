part of g3.stimpack.story.generated;



class StimStoryOnStimModelType {
  StimModelType epic;

  StimModelType story;

  StimModelType action;

  StimModelType actor;
}


class StimStoryOnStimRbacResource {
  StimRbacResource manageFeature;
}



extension StimStoryOnStimModelTypeExtension on StimModelTypeScope {
  StimStoryOnStimModelType get story {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return stimpack.story.onStimModelType;
  }
}


extension StimStoryOnStimRbacResourceExtension on StimRbacResourceScope {
  StimStoryOnStimRbacResource get story {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return stimpack.story.onStimRbacResource;
  }
}
