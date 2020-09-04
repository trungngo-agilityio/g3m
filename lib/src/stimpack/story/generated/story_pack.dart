part of g3.stimpack.story.generated;


/// The only instance of the [StimStory] pack.
StimStory _story;



class StimStory extends StimPack {
  StimModelPackage _metaPackage;

  /// Scope class for constructing all "epic" symbols, 
  /// typed of [StimStoryEpic]."
  final StimStoryEpicScope epic;

  /// Scope class for constructing all "story" symbols, 
  /// typed of [StimStoryStory]."
  final StimStoryStoryScope story;

  /// Scope class for constructing all "action" symbols, 
  /// typed of [StimStoryAction]."
  final StimStoryActionScope action;

  /// Scope class for constructing all "actor" symbols, 
  /// typed of [StimStoryActor]."
  final StimStoryActorScope actor;

  final StimStoryOnStimModelType onStimModelType;

  final StimStoryOnStimRbacResource onStimRbacResource;


  StimStory(StimModel model, StimRbac rbac):
      epic = StimStoryEpicScope(),
      story = StimStoryStoryScope(),
      action = StimStoryActionScope(),
      actor = StimStoryActorScope(),
      onStimModelType = StimStoryOnStimModelType(),
      onStimRbacResource = StimStoryOnStimRbacResource(),
      super('story') {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();

    /// Call custom pack initialization code, this code is
    /// not overwritten during pack re-generation. 
    stimInitStoryPack(this);
  }


  void _buildMeta() {
    final m = stimpack.model, f = m.field, t = m.type;
    final mp = _metaPackage = m.package.of(name: 'story');
    final mt = onStimModelType;
    /// Builds type "epic"
    mt.epic = t.symbolOf(name: 'epic', package: mp);

    /// Builds type "story"
    mt.story = t.symbolOf(name: 'story', package: mp);

    /// Builds type "action"
    mt.action = t.symbolOf(name: 'action', package: mp);

    /// Builds type "actor"
    mt.actor = t.symbolOf(name: 'actor', package: mp);

    /// Builds fields for type "epic"
    mt.epic.fields = {
      /// field "epic"
      f.of(name: 'stories', type: t.setOf(item: mt.story)).required()
    };

    /// Builds fields for type "story"
    mt.story.fields = {
      /// field "story"
      f.of(name: 'actor', type: mt.actor).required(),

      /// field "story"
      f.of(name: 'action', type: mt.action).required()
    };

    /// Builds fields for type "action"
    mt.action.fields = {
      /// field "action"
      f.of(name: 'actions', type: t.setOf(item: mt.action))
    };

    /// Builds fields for type "actor"
    mt.actor.fields = {
      /// field "actor"
      f.of(name: 'roles', type: t.setOf(item: t.rbac.role))
    };
  }
}



// Provides global access to the "story" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension StimStoryPackExtension on StimpackRoot {
  StimStory get story {
    return _story ??= StimStory(stimpack.model, stimpack.rbac);
  }
}
