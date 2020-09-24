part of g3.stimpack.story.init;


/// The only instance of the [StimStory] pack.
StimStory _story;



// Provides global access to the "story" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension OnStimPackStoryExtension on StimpackRoot {
  StimStory get story {
    if (_story == null) {
      _story = StimStory.stimStoryInstance();
      _stimInitStoryPack();
    }
    return _story;
  }
}
