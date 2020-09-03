part of g3.stimpack.story.generated;

/// This function is called during the initialization of story
void stimInitStoryPack(StimStory pack) {
  _buildActors(pack);
  _buildActions(pack);
}

void _buildActors(StimStory pack) {}

void _buildActions(StimStory pack) {
  _buildCrudActions(pack);
  _buildAuthActions(pack);
  _buildReversibleActions(pack);
  _buildFlowActions(pack);
  _buildMiscActions(pack);
}

void _buildCrudActions(StimStory pack) {
  final a = pack.action;

  /// manage is a set of other actions.
  a.manage = a.of(name: 'manage', actions: {
    a.create = a.of(name: 'create'),
    a.update = a.of(name: 'update'),
    a.get = a.of(name: 'get'),
    a.find = a.of(name: 'find'),
    a.delete = a.of(name: 'delete'),
    a.undelete = a.of(name: 'undelete'),
  });
}

void _buildAuthActions(StimStory pack) {
  final a = pack.action;
  a.signUp = a.of(name: 'sign up');
  a.signIn = a.of(name: 'sign in');
  a.signOut = a.of(name: 'sign out');
}

void _buildReversibleActions(StimStory pack) {
  final a = pack.action;
  a.star = a.of(name: 'star');
  a.unstar = a.of(name: 'unstar');

  a.like = a.of(name: 'like');
  a.unlike = a.of(name: 'unlike');

  a.send = a.of(name: 'send');
  a.receive = a.of(name: 'receive');

  a.submit = a.of(name: 'submit');
  a.cancel = a.of(name: 'cancel');

  a.share = a.of(name: 'share');
  a.unshare = a.of(name: 'unshare');

  a.start = a.of(name: 'start');
  a.stop = a.of(name: 'stop');

  a.play = a.of(name: 'play');
  a.pause = a.of(name: 'pause');
  a.resume = a.of(name: 'resume');

  a.enter = a.of(name: 'enter');
  a.leave = a.of(name: 'leave');

  a.upload = a.of(name: 'upload');
  a.download = a.of(name: 'download');
}

void _buildFlowActions(StimStory pack) {
  final a = pack.action;
  a.invite = a.of(name: 'invite');
  a.suggest = a.of(name: 'suggest');
  a.accept = a.of(name: 'accept');
  a.deny = a.of(name: 'deny');
}

void _buildMiscActions(StimStory pack) {
  final a = pack.action;

  a.request = a.of(name: 'request');
  a.reset = a.of(name: 'reset');
  a.see = a.of(name: 'see');
}
