library g3.stimpack.story.generated;


import 'package:g3m/stimpack_core.dart';
import 'package:g3m/stimpack_meta.dart';
import 'package:meta/meta.dart';
import 'package:g3m/stimpack_model.dart';
part '../story_init.dart';
part 'story__story.dart';
part 'story__action.dart';
part 'story__actor.dart';


/// The only instance of the [StimStory] pack.
StimStory _story;



class StimStory extends StimPack {
  final StimStoryTypeMeta meta;

  StimModelPackage _metaPackage;

  /// Scope class for constructing all "stimStoryStory" symbols, 
  /// typed of [StimStoryStory]."
  final StimStoryStoryScope stimStoryStory;

  /// Scope class for constructing all "stimStoryAction" symbols, 
  /// typed of [StimStoryAction]."
  final StimStoryActionScope stimStoryAction;

  /// Scope class for constructing all "stimStoryActor" symbols, 
  /// typed of [StimStoryActor]."
  final StimStoryActorScope stimStoryActor;


  StimStory(StimModel model):
      meta = StimStoryTypeMeta(),
      stimStoryStory = StimStoryStoryScope(),
      stimStoryAction = StimStoryActionScope(),
      stimStoryActor = StimStoryActorScope(),
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


    /// Builds type "stimStoryStory"
    meta.stimStoryStory = t.symbolOf(name: 'stimStoryStory', package: mp);

    /// Builds type "stimStoryAction"
    meta.stimStoryAction = t.symbolOf(name: 'stimStoryAction', package: mp, values: {
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
      'un star',
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

    /// Builds type "stimStoryActor"
    meta.stimStoryActor = t.symbolOf(name: 'stimStoryActor', package: mp);


    /// Builds fields for type "stimStoryStory"
    meta.stimStoryStory.fields = {
      /// field "stimStoryStory"
      f.of(name: 'actor', type: meta.stimStoryActor).required(),


      /// field "stimStoryStory"
      f.of(name: 'action', type: meta.stimStoryAction).required()
    };
  }
}


class StimStoryTypeMeta {
  StimModelType stimStoryStory;

  StimModelType stimStoryAction;

  StimModelType stimStoryActor;
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
