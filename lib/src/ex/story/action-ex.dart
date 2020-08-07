part of g3m.ex;

class StoryActionScopeEx extends ActionScope {
  StoryActionScopeEx() {
    _crudActions();
    _commonActions();
  }

  // --------------------------------------------------------------------------
  // Crud Actions
  // --------------------------------------------------------------------------
  Action create;
  Action update;
  Action get;
  Action find;

  Action delete;
  Action undelete;

  Action manage;

  void _crudActions() {
    create = call('create');
    update = call('update');
    get = call('get');
    find = call('find');
    delete = call('delete');
    undelete = call('undelete');

    manage = create + update + get + find + delete + undelete;
  }

  // --------------------------------------------------------------------------
  // Actions
  // --------------------------------------------------------------------------

  Action signUp;
  Action signIn;
  Action signOut;

  Action request;

  Action reset;

  Action star;
  Action unstar;

  Action like;
  Action unlike;

  Action send;
  Action receive;

  Action invite;
  Action accept;
  Action deny;
  Action see;

  Action suggest;
  Action cancel;

  Action share;
  Action unshare;

  Action start;
  Action stop;

  Action pause;
  Action resume;

  Action enter;
  Action leave;

  Action upload;
  Action download;

  void _commonActions() {
    signUp = call('sign up');
    signIn = call('sign in');
    signOut = call('sign out');

    request = call('request');

    reset = call('reset');

    star = call('star');
    unstar = call('unstar');

    like = call('like');
    unlike = call('unlike');

    send = call('send');
    receive = call('receive');

    invite = call('invite');
    accept = call('accept');
    deny = call('deny');
    see = call('see');

    suggest = call('suggest');
    cancel = call('cancel');

    share = call('share');
    unshare = call('unshare');

    start = call('start');
    stop = call('stop');

    pause = call('pause');
    resume = call('resume');

    enter = call('enter');
    leave = call('leave');

    upload = call('upload');
    download = call('download');
  }
}
