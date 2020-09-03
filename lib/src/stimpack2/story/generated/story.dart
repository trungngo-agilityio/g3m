library g3.stimpack2.story.generated;


import 'package:g3m/stimpack2_core.dart';
import 'package:g3m/stimpack2_meta.dart';
import 'package:meta/meta.dart';
import 'package:g3m/stimpack2_model.dart';
part '../story_init.dart';
part 'story__epic.dart';
part 'story__action.dart';
part 'story__actor.dart';


/// The only instance of the [StimStory] pack.
StimStory _story;



class StimStory extends StimPack {
  final StimStoryTypeMeta meta;

  StimModelPackage _metaPackage;

  /// Scope class for constructing all "epic" symbols, 
  /// typed of [StimStoryEpic]."
  final StimStoryEpicScope epic;

  /// Scope class for constructing all "action" symbols, 
  /// typed of [StimStoryAction]."
  final StimStoryActionScope action;

  /// Scope class for constructing all "actor" symbols, 
  /// typed of [StimStoryActor]."
  final StimStoryActorScope actor;


  StimStory(StimModel model):
      meta = StimStoryTypeMeta(),
      epic = StimStoryEpicScope(),
      action = StimStoryActionScope(),
      actor = StimStoryActorScope(),
      super('story') {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();

    /// Call custom pack initialization code, this code is
    /// not overwritten during pack re-generation. 
    stimInitStoryPack(this);
  }


  void _buildMeta() {
    final m = stimpack.model;
    final mp = _metaPackage = m.package.of(name: 'story');
    final f = m.field, t = m.type;


    /// Builds type "epic"
    meta.epic = t.symbolOf(name: 'epic', package: mp);

    /// Builds type "action"
    meta.action = t.symbolOf(name: 'action', package: mp);

    /// Builds type "actor"
    meta.actor = t.symbolOf(name: 'actor', package: mp);


    /// Builds fields for type "epic"
    meta.epic.fields = {
      /// field "epic"
      f.of(name: 'actor', type: meta.actor).required(),


      /// field "epic"
      f.of(name: 'action', type: meta.action).required()
    };
  }
}


class StimStoryTypeMeta {
  StimModelType epic;

  StimModelType action;

  StimModelType actor;
}



// Provides global access to the "story" pack. Only one instance of the pack 
// is created. During the creation, other packs that this pack depends on might 
// be created as well.
//  
extension StimStoryPackExtension on StimpackRoot {
  StimStory get story {
    return _story ??= StimStory(stimpack.model);
  }
}


extension StimStoryTypeMetaExtension on StimModelTypeScope {
  StimStoryTypeMeta get story {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return stimpack.story.meta;
  }
}
