library g3.stimpack.story.generated;


import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:meta/meta.dart';
import 'package:g3m/stimpack_model.dart';
import 'package:g3m/stimpack_rbac.dart';
part '../story_init.dart';
part 'story_story.dart';
part 'story_action.dart';
part 'story_actor.dart';


/// The only instance of the [StimStory] pack.
StimStory _story;



class StimStory extends StimPack {
  final StimStoryTypeMeta meta;

  StimModelPackage _metaPackage;

  /// Scope class for constructing all "story" symbols, 
  /// typed of [StimStoryStory]."
  final StimStoryStoryScope story;

  /// Scope class for constructing all "action" symbols, 
  /// typed of [StimStoryAction]."
  final StimStoryActionScope action;

  /// Scope class for constructing all "actor" symbols, 
  /// typed of [StimStoryActor]."
  final StimStoryActorScope actor;


  StimStory(StimModel model, StimRbac rbac):
      meta = StimStoryTypeMeta(),
      story = StimStoryStoryScope(),
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


    /// Builds type "story"
    meta.story = t.symbolOf(name: 'story', package: mp);

    /// Builds type "action"
    meta.action = t.symbolOf(name: 'action', package: mp, values: {
      'create',
      'update',
      'get',
      'find',
      'delete',
      'undelete',
      'manage',
      'sign up',
      'sign in',
      'sign out',
      'star',
      'unstar',
      'like',
      'unlike',
      'send',
      'receive',
      'submit',
      'cancel',
      'share',
      'unshare',
      'start',
      'stop',
      'play',
      'pause',
      'resume',
      'enter',
      'leave',
      'upload',
      'download',
      'invite',
      'suggest',
      'accept',
      'deny',
      'request',
      'reset',
      'see'
    });

    /// Builds type "actor"
    meta.actor = t.symbolOf(name: 'actor', package: mp);


    /// Builds fields for type "story"
    meta.story.fields = {
      /// field "story"
      f.of(name: 'actor', type: meta.actor).required(),


      /// field "story"
      f.of(name: 'action', type: meta.action).required()
    };


    /// Builds fields for type "action"
    meta.action.fields = {
      /// field "action"
      f.of(name: 'actions', type: t.setOf(item: meta.action))
    };


    /// Builds fields for type "actor"
    meta.actor.fields = {
      /// field "actor"
      f.of(name: 'roles', type: t.setOf(item: t.rbac.role))
    };
  }
}


class StimStoryTypeMeta {
  StimModelType story;

  StimModelType action;

  StimModelType actor;
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


extension StimStoryTypeMetaExtension on StimModelTypeScope {
  StimStoryTypeMeta get story {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return stimpack.story.meta;
  }
}
